# Beam Attack Implementation Plan

## Overview
A Phase 2 wither attack (300-100 HP): the wither blasts upward through a column of creeper explosions, summons tiny ender crystals in its head that project beams toward players with a sweeping descent animation, then fires explosive raycasts along those beam lines in a staggered sequence.

## Answers to Open Questions
- **Trigger**: Phase 2 (300-100 HP), first at 35s after Phase 2 starts, then every 80s
- **Crystals**: Visible, full size (cannot be scaled or made invisible). Wither Rotation set to [0,0], crystals placed at `~ ~4 ~` (center/top), `~2 ~3 ~` (right), `~-2 ~3 ~` (left) relative to wither
- **Targeting**: Side heads both target the same player (`@p`). Center head targets `@r` (could be same or different in multiplayer). Side beams fire 10 ticks apart — devastating to the targeted player
- **Toggle**: Yes, `togglebeam` in config system
- **Block destruction**: Always on (no toggle check for destruction)
- **No enraged variant**: Does not trigger below 100 HP
- **Ascent**: Tp up 1.5 blocks/tick for 20 ticks (30 blocks), with midpoint-style creeper column to clear the path

---

## Attack Sequence

### Phase 1: Ascent (~20 ticks / 1 second)

**`beampre.mcfunction`** — Entry point (called by schedule from tick/phase2 init):
- Check `togglebeam:Enabled` in `wither:options`
- Add `Beam` tag to wither
- `NoAI:1b`, Resistance 255 (300 ticks ≈ 15s, covers entire attack)
- Glow on
- Do not save return position: wherever the wither ends up, it will stay there afterwards.
- Spawn creeper column to clear path (like midpoint.mcfunction):
  - Creepers every 5 blocks from ~0 to ~30, staggered fuse (1,3,5,7,9,11)
  - Invisible, silent, Team:"Wither"
- Play charge-up sound (`entity.wither.spawn` low pitch)
- Schedule `beamascend` at 1t (start ascending)
- Schedule `beamascend` to repeat — actually, use a self-rescheduling pattern:

**`beamascend.mcfunction`** — Runs every tick for 20 ticks:
- Tp wither `~ ~1.5 ~` (relative up)
- Particle trail: `lava` + `soul_fire_flame` at wither pos
- Increment `beamTimer` scoreboard
- If `beamTimer` < 20: schedule self at 1t
- If `beamTimer` >= 20: call `beamcrystals` (next phase)

### Phase 2: Crystal Summon + Beam Animation (~260 ticks / 13 seconds)

**`beamcrystals.mcfunction`** — Summon crystals and aim markers:
- Reset `beamTimer` to 0
- Set wither Rotation to `[0f, 0f]` (facing south, level) so crystal positions are consistent. The wither will not move
- Summon 3 ender crystals at fixed offsets from wither:
  ```
  # Center crystal (top of head)
  execute at @e[type=wither,tag=ominousWither,limit=1] run summon end_crystal ~ ~4 ~ {ShowBottom:0b,Tags:["beamCrystalC"]}
  # Right crystal (right head)
  execute at @e[type=wither,tag=ominousWither,limit=1] run summon end_crystal ~2 ~3 ~ {ShowBottom:0b,Tags:["beamCrystalR"]}
  # Left crystal (left head)
  execute at @e[type=wither,tag=ominousWither,limit=1] run summon end_crystal ~-2 ~3 ~ {ShowBottom:0b,Tags:["beamCrystalL"]}
  ```
- Summon 2 invisible armor stand markers for beam target tracking:
  - `beamTargetSide` — tp to `@p` then `~ ~120 ~` (side heads' shared target)
  - `beamTargetCenter` — tp to `@r` then `~ ~120 ~` (center head target)
- Set initial `BeamTarget` on each crystal to its marker's position
- Schedule `beamaimtick` at 1t

**`beamaimtick.mcfunction`** — Runs every tick, updates beam targets:
- Increment `beamTimer`
- Update marker XZ to track their target player's current XZ position
- **Ticks 1-60** (circling phase): Apply circular XZ offset to markers. Use 12 pre-computed positions (every 30°, 15-block radius), cycling every 5 ticks:
  ```
  beamTimer 1-5:   offset +15, +0
  beamTimer 6-10:  offset +13, +7.5
  beamTimer 11-15: offset +7.5, +13
  beamTimer 16-20: offset +0, +15
  beamTimer 21-25: offset -7.5, +13
  beamTimer 26-30: offset -13, +7.5
  beamTimer 31-35: offset -15, +0
  beamTimer 36-40: offset -13, -7.5
  beamTimer 41-45: offset -7.5, -13
  beamTimer 46-50: offset +0, -15
  beamTimer 51-55: offset +7.5, -13
  beamTimer 56-60: offset +13, -7.5
  ```
- **Ticks 61-160** (slow descent): Move markers down 0.5 blocks/tick. Markers drop 50 blocks (120→70 above player)
- **Ticks 161-190** (medium descent): Move markers down 1 block/tick. Drop 30 blocks (70→40)
- **Ticks 191-210** (fast descent): Move markers down 2 blocks/tick. Drop 40 blocks (40→0, at player eye level)
- **Ticks 211-260** (locked on): Tp markers directly to target player position
- Each tick: copy marker Pos into crystal `BeamTarget` NBT
- Each tick: particles along beam for visual feedback (`end_rod` at marker pos)
- Sound: escalating pitch `entity.experience_orb.pickup` as beam descends (every 20 ticks)
- At tick 260: schedule `beamfire_left` at 1t

**Circle offset implementation**: Rather than 60 separate files, use `beamaimtick.mcfunction` with scoreboard range checks:
```mcfunction
# Example for one circle position (ticks 1-5)
execute if score ominousWither beamTimer matches 1..5 as @e[tag=beamTargetSide] at @s run tp @s ~15 ~ ~0
```
The markers first get tp'd to the target player's XZ each tick, THEN the circle offset is applied on top, THEN the Y descent is applied. This keeps horizontal tracking while orbiting.

### Phase 3: Fire (~10 ticks)

**`beamfire_left.mcfunction`** — Left side head fires:
- Execute positioned at `beamCrystalL`, facing `beamTargetSide`
- Call `beamraycast` (recursive)
- Boom sound + flash particles
- Schedule `beamfire_center` at 5t

**`beamfire_center.mcfunction`** — Center head fires:
- Execute positioned at `beamCrystalC`, facing `beamTargetCenter`
- Call `beamraycast`
- Schedule `beamfire_right` at 5t

**`beamfire_right.mcfunction`** — Right side head fires:
- Execute positioned at `beamCrystalR`, facing `beamTargetSide` (same target as left)
- Call `beamraycast`
- Schedule `beamend` at 10t

**`beamraycast.mcfunction`** — Recursive raycast step:
```mcfunction
# Stop at solid blocks
execute unless block ~ ~ ~ #minecraft:replaceable run return 0

# Safety limit (max 300 steps = 150 blocks)
scoreboard players add #beam_steps beamStep 1
execute if score #beam_steps beamStep matches 300.. run return 0

# invisible beam -- no particles, just explosions

# Spawn creeper every 6 steps (= 3 blocks)
execute if score #beam_steps beamStep matches 6 run function wither:wither/phase2/beam/beamcreeper
execute if score #beam_steps beamStep matches 12 run function wither:wither/phase2/beam/beamcreeper
# ... (use modulo via reset: if matches 6, spawn + reset to 0)
# Actually: track a second counter for spacing

# No direct damage to players in beam path, they will be blown up

# Step forward 0.5 blocks and recurse
execute positioned ^ ^ ^0.5 run function wither:wither/phase2/beam/beamraycast
```

**`beamcreeper.mcfunction`** — Spawn beam explosion:
```mcfunction
summon creeper ~ ~ ~ {Team:"Wither",Silent:1b,Fuse:0,ignited:1b,ExplosionRadius:3b,CustomName:"Ominous Wither's Beam",attributes:[{id:"minecraft:scale",base:0.0625}],active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}]}
```

### Phase 4: Cleanup

**`beamend.mcfunction`**:
- Kill `beamCrystalL`, `beamCrystalC`, `beamCrystalR`
- Kill `beamTargetSide`, `beamTargetCenter`
- Remove `Beam` tag
- `NoAI:0b`, `Glowing:0b`
- Schedule next beam attack at 80s

---

## File List

All under `data/wither/function/wither/phase2/beam/`:

| File | Purpose |
|------|---------|
| `beampre.mcfunction` | Entry: NoAI, resistance, creeper column, start ascent |
| `beamascend.mcfunction` | Self-rescheduling 1t ascent loop (20 ticks) |
| `beamcrystals.mcfunction` | Summon crystals + aim markers, start aim tick |
| `beamaimtick.mcfunction` | Self-rescheduling 1t aim loop (260 ticks): circle, descend, lock |
| `beamfire_left.mcfunction` | Left side raycast fire |
| `beamfire_center.mcfunction` | Center raycast fire (scheduled +5t) |
| `beamfire_right.mcfunction` | Right side raycast fire (scheduled +10t) |
| `beamraycast.mcfunction` | Recursive raycast: particles, creepers, block check |
| `beamcreeper.mcfunction` | Summon instant-explode creeper |
| `beamend.mcfunction` | Cleanup: kill entities, restore AI, schedule next |

Toggle files under `data/wither/function/wither/toggle/`:

| File | Purpose |
|------|---------|
| `tbeam.mcfunction` | Toggle router |
| `tbeamon.mcfunction` | Enable beam + UI feedback |
| `tbeamoff.mcfunction` | Disable beam + UI feedback |

## Integration Points

1. **`load.mcfunction`**: Add `scoreboard objectives add beamTimer dummy` and `scoreboard objectives add beamStep dummy`
2. **`initialize_storage.mcfunction`**: Add `togglebeam:Enabled` to default options
3. **`tick.mcfunction`**: No direct change — beam is triggered via `schedule` from Phase 2 start
4. **`5tick.mcfunction`**: Add `Beam` tag check → appropriate hit handler (like `Charge` → `hit3`)
5. **Phase 2 entry** (wherever charge is first scheduled): Add `schedule function wither:wither/phase2/beam/beampre 20s`
6. **`config.mcfunction`** / toggle pages: Add beam toggle button
7. **`wither/lifecycle/cleanup.mcfunction`**: Kill beam entities on fight end
8. **`wither/lifecycle/death.mcfunction`**: Kill beam entities on wither death

## Scoreboard Objectives

```
beamTimer  — tick counter for ascent (0-20) and aim animation (0-260)
beamStep   — raycast step counter (reset per fire, max 300)
```

## Technical Notes

- Creeper spacing in raycast: Use two scoreboard counters — `#beam_steps` for total distance (safety cap) and `#beam_spacing` for creeper spacing (reset every 6 steps)
- The `beamaimtick` circle offsets are applied AFTER tp'ing the marker to the player's XZ, so the marker orbits around the player even if they move
- Ender crystal `BeamTarget` is set as `{BeamTarget:{X:int,Y:int,Z:int}}` — we copy from marker Pos each tick using `data modify ... set from entity ...`
- Crystals are full size (cannot be scaled/hidden). Placed at fixed offsets relative to wither with Rotation [0,0] so positions are predictable. They'll be visible floating near the heads — intentional visual
- Max 50 creepers per beam × 3 beams = 150 total, but staggered 5 ticks apart so max ~50 simultaneous
