#  Ominous Wither Combat Rework — Scoped Plan

## Context

The Ominous Wither fight is dominated by Elytra + Spear. Phase 2 is a pile-on of escalating attacks with no clear identity. There is no punishment for fleeing, and a surviving wither may be unbeatable. This plan implements a focused set of changes to create 3 distinct phase identities and add pursuit/despawn safety mechanics.

---

## Changes Summary

| Change | Scope | File(s) |
|---|---|---|
| Initial explosion + obsidian/bedrock fill + skull wave | Modify init | `ominous_init.mcfunction`, `lifecycle/skull_wave.mcfunction` |
| Phase 2 clearance — vertical tunnel before archers spawn | New + midpoint change | `midpoint/clearance.mcfunction`, `midpoint/midpoint.mcfunction` |
| Gravity Pull — phase 1 anti-elytra | New loop | `phase1/gravity_pull.mcfunction`, `ominous_init.mcfunction` |
| Phase 1 skeleton harassment — skeletons around players | New loop | `phase1/skeleton_spawn.mcfunction`, `phase1/spawn_skel_group.mcfunction` |
| Archer Shield — wither invulnerable while riders alive; kill phantoms on rider death | Modify loop | `5tick.mcfunction` |
| Charge unlocked at 300 HP | Threshold change | `hit3.mcfunction` |
| Resistance III for Phase 3 | Modify loop | `5tick.mcfunction` |
| Wrath Aura — Phase 3 anti-ranged | New loop | `phase3/wrath_aura.mcfunction`, `ominous_init.mcfunction` |
| Phase 3 wither skeleton swarm — groups of 3, netherite swords | Modify existing | `phase2/swarm.mcfunction` |
| Pursuit — nausea at 1s, teleport at 3s, despawn at 6s | New + tick change | `lifecycle/pursuit.mcfunction` |
| Chunk loading — forceload at spawn, macro remove on cleanup | New | `lifecycle/forceload_remove.mcfunction`, `ominous_init.mcfunction` |

---

## 1. Initial Spawn Explosion

**Goal**: When the ominous wither appears, obliterate the surrounding area before the wither even begins to move. Hides the wither's size-up and prevents the obsidian-box or spawn-in-bedrock cheese.

`spawn.mcfunction` already fires a radius-13 creeper explosion at spawn. This section adds the fill pass for indestructible blocks and the skull wave on top of that.

**Add to `ominous_init.mcfunction`** (runs immediately at fight start):

```
# Clear indestructible blocks in a 6-block sphere — anti-cage
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 air replace minecraft:bedrock
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 air replace minecraft:obsidian
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 air replace minecraft:crying_obsidian

# 2 seconds later: skull wave in all directions
schedule function wither:wither/lifecycle/skull_wave 40t
```

**New file**: `R1.21.11+/data/wither/function/wither/lifecycle/skull_wave.mcfunction`

Summons ~26 blue wither skulls covering all directions. Each skull carries a creeper passenger (ExplosionRadius:8) that detonates ~1.5s after launch regardless of skull impact — if the skull has already hit something, the creeper sits at the impact point for a brief moment then explodes.

Creeper passenger NBT: `{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}`

- `Fuse:30` (1.5s): countdown starts immediately; skull will usually have hit terrain by then
- `NoGravity:1b`: stays at the impact point after the skull despawns rather than falling away
- `Invulnerable:1b`: can't be killed by another skull's secondary explosion before its own fuse fires

Skull directions (speed ~1.5 blocks/tick):

```
# Horizontal ring (8)
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[1.5d,0.0d,0.0d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-1.5d,0.0d,0.0d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.0d,0.0d,1.5d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.0d,0.0d,-1.5d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[1.06d,0.0d,1.06d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-1.06d,0.0d,1.06d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[1.06d,0.0d,-1.06d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-1.06d,0.0d,-1.06d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}

# Upper hemisphere (8, ~45° up)
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[1.06d,1.06d,0.0d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-1.06d,1.06d,0.0d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.0d,1.06d,1.06d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.0d,1.06d,-1.06d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.75d,1.06d,0.75d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-0.75d,1.06d,0.75d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.75d,1.06d,-0.75d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-0.75d,1.06d,-0.75d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}

# Lower hemisphere (8, ~45° down)
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[1.06d,-1.06d,0.0d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-1.06d,-1.06d,0.0d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.0d,-1.06d,1.06d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.0d,-1.06d,-1.06d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.75d,-1.06d,0.75d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-0.75d,-1.06d,0.75d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.75d,-1.06d,-0.75d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[-0.75d,-1.06d,-0.75d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}

# Poles (2)
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.0d,1.5d,0.0d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon wither_skull ~ ~1 ~ {dangerous:1b,Motion:[0.0d,-1.5d,0.0d],Passengers:[{id:"minecraft:creeper",Fuse:30,ExplosionRadius:8,ignited:1b,Silent:1b,Invulnerable:1b,NoGravity:1b}]}
```

**Note on `toggledestructive`**: The fill commands and skull-wave explosions are intentional anti-cheat mechanics and bypass the block destruction toggle.

---

## 2. Phase 2 Transition Clearance

**Goal**: When the midpoint animation begins, blast a vertical shaft above the wither before the phantom archers spawn. This ensures archers never get stuck in blocks when the fight was started underground.

**Timing constraint**: Phantom spawns begin at `5t` in `midpoint.mcfunction` (earliest `schedule function blaze1 5t`). Clearance must fire at `1t` so all explosions resolve before any archers exist.

**Add to `midpoint/midpoint.mcfunction`** (near the top, before the blaze schedules):
```
# Clear vertical space before phantom archers spawn (clearance fires at 1t, archers at 5t+)
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/midpoint/clearance 1t
```

**New file**: `R1.21.11+/data/wither/function/wither/midpoint/clearance.mcfunction`

Five creepers stacked vertically above the wither with overlapping blast radii (radius 8, spaced every 9 blocks) create a roughly 16-wide, ~50-block-tall clear shaft. All fire on the same tick (`Fuse:0`). `Invulnerable:1b` ensures each creeper survives long enough to detonate even if adjacent explosions fire first.

```
# Vertical shaft clearance — fires at 1t, phantoms spawn at 5t+
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~5  ~ {Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,ExplosionRadius:8,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~14 ~ {Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,ExplosionRadius:8,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~23 ~ {Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,ExplosionRadius:8,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~32 ~ {Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,ExplosionRadius:8,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~41 ~ {Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,ExplosionRadius:8,attributes:[{id:"minecraft:scale",base:0.0625}]}
```

**Why archers are safe**: Since clearance fires at `1t` and the first archer is summoned at `5t`, no phantoms or wither skeletons exist during the explosions. They spawn into the already-cleared space.

**Note on `toggledestructive`**: Same as the initial explosion — this clearance is a structural prerequisite and bypasses the block destruction toggle.

---

## 3. Gravity Pull (Phase 1 — Anti-Elytra)

**Goal**: Make sustained elytra gliding near the wither dangerous during the bow phase.

**New file**: `R1.21.11+/data/wither/function/wither/phase1/gravity_pull.mcfunction`

Logic:
- Reschedules itself every 100t (5s) while `ominousWither` AND `Wither` tag still exists
- For each player within 40 blocks who has `{FallFlying:1b}`, apply `Motion:[0.0d,-1.8d,0.0d]` — kills glide momentum and yanks them toward the ground
- Visual: small burst of falling dust particles at the wither's position as the pulse fires

**Add to `ominous_init.mcfunction`**:
```
schedule function wither:wither/phase1/gravity_pull 15s
```

**Phase detection**: Function checks `if entity @e[type=wither,tag=ominousWither,tag=Wither]` before rescheduling — stops automatically when Phase 2 begins.

---

## 4. Phase 1 Skeleton Harassment

**Goal**: During Phase 1, skeletons periodically emerge from the ground near players to create melee pressure and discourage camping.

**New file**: `R1.21.11+/data/wither/function/wither/phase1/skeleton_spawn.mcfunction`

Logic:
- Reschedules itself every 300t (15s) while `ominousWither` AND `Wither` tag exists (stops at midpoint)
- Runs `phase1/spawn_skel_group` as each player within 150 blocks

```
# Reschedule while phase 1 is active
execute if entity @e[type=wither,tag=ominousWither,tag=Wither] run schedule function wither:wither/phase1/skeleton_spawn 300t

# Spawn a skeleton group at each player within 150 blocks
execute as @e[type=wither,tag=ominousWither,limit=1] as @a[distance=..150,gamemode=!spectator] at @s run function wither:wither/phase1/spawn_skel_group
```

**New file**: `R1.21.11+/data/wither/function/wither/phase1/spawn_skel_group.mcfunction`

Runs `at @s` (at player position). Spawns 4 skeletons at diagonal offsets 3 blocks away, 2 blocks underground, with upward motion to simulate emerging. Stone sword, no drops, team Wither. Dirt particle burst covers spawn point.

```
# 4 skeletons emerging from underground at diagonal offsets
summon skeleton ~3 ~-2 ~3 {Team:"Wither",Tags:["wSkel1"],equipment:{mainhand:{id:"minecraft:stone_sword",count:1}},drop_chances:{mainhand:0,feet:0,legs:0,chest:0,head:0},Motion:[0.0d,0.4d,0.0d]}
summon skeleton ~-3 ~-2 ~3 {Team:"Wither",Tags:["wSkel1"],equipment:{mainhand:{id:"minecraft:stone_sword",count:1}},drop_chances:{mainhand:0,feet:0,legs:0,chest:0,head:0},Motion:[0.0d,0.4d,0.0d]}
summon skeleton ~3 ~-2 ~-3 {Team:"Wither",Tags:["wSkel1"],equipment:{mainhand:{id:"minecraft:stone_sword",count:1}},drop_chances:{mainhand:0,feet:0,legs:0,chest:0,head:0},Motion:[0.0d,0.4d,0.0d]}
summon skeleton ~-3 ~-2 ~-3 {Team:"Wither",Tags:["wSkel1"],equipment:{mainhand:{id:"minecraft:stone_sword",count:1}},drop_chances:{mainhand:0,feet:0,legs:0,chest:0,head:0},Motion:[0.0d,0.4d,0.0d]}

# Dirt particle bursts at spawn points
particle minecraft:block minecraft:dirt ~3 ~ ~3 0.5 0.5 0.5 0.1 30
particle minecraft:block minecraft:dirt ~-3 ~ ~3 0.5 0.5 0.5 0.1 30
particle minecraft:block minecraft:dirt ~3 ~ ~-3 0.5 0.5 0.5 0.1 30
particle minecraft:block minecraft:dirt ~-3 ~ ~-3 0.5 0.5 0.5 0.1 30

# Sound
playsound minecraft:entity.zombie.break_wooden_door hostile @a[distance=..30] ~ ~ ~ 1 0.5
```

**Add to `ominous_init.mcfunction`**:
```
schedule function wither:wither/phase1/skeleton_spawn 15s
```

---

## 5. Archer Shield (Phase 2 — Wither Invulnerable While Riders Live)

**Goal**: Force players to deal with the phantom archer swarm before being able to damage the wither. When all wither skeleton riders are killed, the remaining phantom mounts are also killed simultaneously.

**Modify**: `R1.21.11+/data/wither/function/5tick.mcfunction`

Add near the top (before the phase routing):
```
# Phase 2: Wither protected while wither skeleton riders alive
execute if entity @e[type=wither,tag=ominousWither,tag=Charge] if entity @e[type=wither_skeleton,tag=wArcher] as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {active_effects:[{id:"minecraft:resistance",amplifier:254,duration:40,show_particles:1b}]}
execute if entity @e[type=wither,tag=ominousWither,tag=Charge] if entity @e[type=wither_skeleton,tag=wArcher] as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {Glowing:1b}
execute if entity @e[type=wither,tag=ominousWither,tag=Charge] unless entity @e[type=wither_skeleton,tag=wArcher] as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {Glowing:0b}
execute if entity @e[type=wither,tag=ominousWither,tag=Charge] unless entity @e[type=wither_skeleton,tag=wArcher] run kill @e[type=phantom,tag=wArcher]
```

- The condition checks specifically for `type=wither_skeleton,tag=wArcher` (the riders), not all `wArcher` entities. Dismounted phantoms don't keep the shield up.
- `amplifier:254` = Resistance 255 — negates all damage taken
- `duration:40` refreshed every 5t — wither stays protected as long as any rider exists
- `Glowing:1b` gives a visible outline signal: "wither is invulnerable"
- When the last rider dies: Resistance expires, Glowing is removed, and all remaining phantom mounts are killed in the same 5tick pass

**No passive mob spawning in Phase 2** — the archer swarm from the midpoint is challenge enough.

**Note**: `active_effects` via `data merge` replaces the effect list. The charge's own Resistance 255 (temporary, during charge) is on the `Charge` tag path; once that tag is removed during charge wind-up, Phase 3 Resistance III takes over. No conflict.

---

## 6. Charge Unlocked at 300 HP (Phase 2 Start)

**Goal**: Charge attack begins immediately when Phase 2 starts, not at 250 HP.

**Modify**: `R1.21.11+/data/wither/function/wither/hit/hit3.mcfunction`

Current:
```
execute as @e[type=wither,tag=ominousWither,scores={Health=..260}] at @s run scoreboard players set wCharge wcharge1 2
execute as @e[type=wither,tag=ominousWither,scores={Health=..250}] if data storage wither:options {togglecharge:Enabled} at @s run function wither:wither/phase2/charge/chargepre
```

Change both thresholds:
```
execute as @e[type=wither,tag=ominousWither,scores={Health=..298}] at @s run scoreboard players set wCharge wcharge1 2
execute as @e[type=wither,tag=ominousWither,scores={Health=..298}] if data storage wither:options {togglecharge:Enabled} at @s run function wither:wither/phase2/charge/chargepre
```

After the midpoint, health is capped at 298f (by `tick.mcfunction`). So `scores={Health=..298}` is immediately true when Phase 2 begins. Charge fires on the first 5tick pass after the wither lands.

---

## 7. Resistance III for Phase 3

**Goal**: Phase 3 (100–0 HP) is significantly harder to chip through — the wither's final desperation.

**Modify**: `R1.21.11+/data/wither/function/5tick.mcfunction`

Add near the phase routing:
```
# Phase 3: Wither has Resistance III
execute if entity @e[type=wither,tag=ominousWither,tag=Dash] as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {active_effects:[{id:"minecraft:resistance",amplifier:2,duration:40,show_particles:0b}]}
```

`amplifier:2` = Resistance III = 60% damage reduction. Refreshed every 5t. Does not show particles.

**Conflict check**: `Dash` is checked before `Charge` in 5tick routing, so `hit3` (charge) is no longer called in Phase 3. No conflict with charge's Resistance 255.

---

## 8. Wrath Aura (Phase 3 — Anti-Ranged)

**Goal**: Force players to close in to melee range during Phase 3. Standing far away and shooting is punished.

**New file**: `R1.21.11+/data/wither/function/wither/phase3/wrath_aura.mcfunction`

Logic:
- Reschedules itself every 20t (1s) while `ominousWither` AND `Dash` tag exists
- `execute as @e[type=wither,tag=ominousWither,tag=Dash,limit=1] at @s as @a[distance=16..,gamemode=!spectator] run damage @s 1 minecraft:wither`
- Visual: ring of crimson particles at the 16-block radius boundary (offset commands at 8 cardinal/diagonal positions)

**Add to `ominous_init.mcfunction`**:
```
schedule function wither:wither/phase3/wrath_aura 20s
```

The function immediately checks `if entity @e[type=wither,tag=ominousWither,tag=Dash]` before doing anything — idles until Phase 3 starts, then activates. Stops rescheduling when ominousWither dies.

---

## 9. Phase 3 Wither Skeleton Swarm

**Goal**: Phase 3 still sends wither skeleton waves, but sparser — 3 elite skeletons instead of 13, less frequently, each more dangerous.

**Modify**: `R1.21.11+/data/wither/function/wither/phase2/swarm.mcfunction`

Reduce from 13 wither skeleton summons to 3. Replace default equipment with netherite swords (fire aspect II, no drop):

```
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run summon wither_skeleton ~ ~ ~ {Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["swarm","wSkel"],Health:10f,equipment:{head:{id:"minecraft:wither_skeleton_skull",count:1},mainhand:{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:fire_aspect":2}}}}},drop_chances:{mainhand:0,head:0,feet:0,legs:0,chest:0},attributes:[{id:"minecraft:armor",base:5},{id:"minecraft:armor_toughness",base:20},{id:"minecraft:attack_knockback",base:0},{id:"minecraft:attack_speed",base:16},{id:"minecraft:knockback_resistance",base:1},{id:"minecraft:max_health",base:10},{id:"minecraft:movement_speed",base:0.5}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run summon wither_skeleton ~ ~ ~ {Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["swarm","wSkel"],Health:10f,equipment:{head:{id:"minecraft:wither_skeleton_skull",count:1},mainhand:{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:fire_aspect":2}}}}},drop_chances:{mainhand:0,head:0,feet:0,legs:0,chest:0},attributes:[{id:"minecraft:armor",base:5},{id:"minecraft:armor_toughness",base:20},{id:"minecraft:attack_knockback",base:0},{id:"minecraft:attack_speed",base:16},{id:"minecraft:knockback_resistance",base:1},{id:"minecraft:max_health",base:10},{id:"minecraft:movement_speed",base:0.5}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run summon wither_skeleton ~ ~ ~ {Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["swarm","wSkel"],Health:10f,equipment:{head:{id:"minecraft:wither_skeleton_skull",count:1},mainhand:{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:fire_aspect":2}}}}},drop_chances:{mainhand:0,head:0,feet:0,legs:0,chest:0},attributes:[{id:"minecraft:armor",base:5},{id:"minecraft:armor_toughness",base:20},{id:"minecraft:attack_knockback",base:0},{id:"minecraft:attack_speed",base:16},{id:"minecraft:knockback_resistance",base:1},{id:"minecraft:max_health",base:10},{id:"minecraft:movement_speed",base:0.5}]}
```

**Frequency**: Find the scoreboard timer that sets the `Swarm` tag on the wither and multiply the cooldown by 3×.

---

## 10. Pursuit (Anti-Flee)

**Goal**: Punish players who fly or flee more than 150 blocks from the wither. Three escalating stages: warning (nausea), pursuit (teleport + strike), then despawn.

**Modify**: `R1.21.11+/data/wither/function/tick.mcfunction`

```
# Flee detection (150-block radius, only during active fight)
execute as @e[type=wither,tag=ominousWither] unless entity @a[distance=..150,gamemode=!spectator] run scoreboard players add wflee wData 1
execute as @e[type=wither,tag=ominousWither] if entity @a[distance=..150,gamemode=!spectator] run scoreboard players set wflee wData 0

# Score 2 = 1s: nausea warning
execute as @e[type=wither,tag=ominousWither] if score wflee wData matches 2 run effect give @a[gamemode=!spectator] minecraft:nausea 10 1

# Score 6 = 3s: pursuit — wither teleports to you
execute as @e[type=wither,tag=ominousWither] if score wflee wData matches 6 run function wither:wither/lifecycle/pursuit

# Score 12 = 6s: despawn
execute as @e[type=wither,tag=ominousWither] if score wflee wData matches 12 run function wither:wither/lifecycle/despawn
```

tick runs every 10t: Score 2 = 1 second, Score 6 = 3 seconds, Score 12 = 6 seconds.

**New file**: `R1.21.11+/data/wither/function/wither/lifecycle/pursuit.mcfunction`

```
# Teleport wither above the nearest player
execute as @e[type=wither,tag=ominousWither,limit=1] at @a[sort=nearest,limit=1] run teleport @s ~ ~10 ~

# Lightning flash at arrival
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon lightning_bolt ~ ~ ~
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon lightning_bolt ~ ~ ~
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon lightning_bolt ~ ~ ~

# Halt nearest player's motion and yank them toward the ground
execute as @a[sort=nearest,limit=1,distance=..10] run data modify entity @s Motion set value [0.0d,-1.8d,0.0d]

# Sound cue
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run playsound minecraft:entity.wither.death hostile @a[distance=..100] ~ ~ ~ 1.5 0.6

# Delayed smite (1 second later)
schedule function wither:wither/lifecycle/pursuit_smite 20t
```

**New file**: `R1.21.11+/data/wither/function/wither/lifecycle/pursuit_smite.mcfunction`

```
execute as @a[sort=nearest,limit=1] at @s run summon lightning_bolt ~ ~ ~
execute as @a[sort=nearest,limit=1] at @s run summon lightning_bolt ~ ~ ~
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~1 ~ {Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,ExplosionRadius:5,powered:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
```

**Cleanup**: `wflee` resets to 0 naturally on the next tick once the player is within 150 blocks. Score continues accumulating toward 12 (despawn) if the player dies and respawns far away.

---

## 11. Despawn (All Players Gone)

**Goal**: If the wither kills all players, it despawns dramatically — no nether star or wither rose drop.

**New file**: `R1.21.11+/data/wither/function/wither/lifecycle/despawn.mcfunction`

```
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~1 ~ {Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,ExplosionRadius:12,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~1 ~ {Invulnerable:1b,Fuse:1,ignited:1b,Silent:1b,ExplosionRadius:15,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon creeper ~ ~1 ~ {Invulnerable:1b,Fuse:2,ignited:1b,Silent:1b,ExplosionRadius:18,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon lightning_bolt ~ ~ ~
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon lightning_bolt ~5 ~ ~
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon lightning_bolt ~-5 ~ ~
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon lightning_bolt ~ ~ ~5
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon lightning_bolt ~ ~ ~-5
kill @e[type=wither,tag=ominousWither]
```

**Note on drops**: `/kill` suppresses loot drops. Confirm this is the case in the current datapack — see the cleanup function which should probably be used instead.

---

## 12. Chunk Loading

**Goal**: Keep the fight area loaded even if no players are nearby.

**Add to `ominous_init.mcfunction`**:
```
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run forceload add ~ ~
execute as @e[type=wither,tag=ominousWither,limit=1] store result storage wither:fight spawnX int 1 run data get entity @s Pos[0]
execute as @e[type=wither,tag=ominousWither,limit=1] store result storage wither:fight spawnZ int 1 run data get entity @s Pos[2]
```

**Add to `tick.mcfunction`** (keeps the loaded chunk current as the wither moves):
```
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run forceload add ~ ~
```

**New file**: `R1.21.11+/data/wither/function/wither/lifecycle/forceload_remove.mcfunction` (macro function):
```
$forceload remove $(spawnX) $(spawnZ)
```

**Call from death/cleanup function**:
```
function wither:wither/lifecycle/forceload_remove with storage wither:fight
```

**Limitation**: Only the spawn chunk and current tick chunk are forceloaded. If the wither ranged far, old chunks must be cleaned up separately. In practice the wither stays roughly in one area, so this is sufficient.

---

## Scoreboard Setup

A new scoreboard objective `wData` must be declared in `load.mcfunction`:
```
scoreboard objectives add wData dummy
```

---

## Key Files to Modify

| File | Change |
|---|---|
| `ominous_init.mcfunction` | Fill commands; schedule skull_wave, gravity_pull, skeleton_spawn, wrath_aura; forceload at spawn + store coordinates |
| `midpoint/midpoint.mcfunction` | Schedule clearance at 1t (before blaze spawns at 5t) |
| `tick.mcfunction` | Add flee counter (wflee/wData), nausea/pursuit/despawn triggers, forceload refresh |
| `5tick.mcfunction` | Archer Shield (Resistance 255 + Glowing + phantom kill on rider death), Phase 3 Resistance III |
| `hit3.mcfunction` | Charge thresholds from 260/250 to 298/298 |
| `phase2/swarm.mcfunction` | Reduce to 3 wither skeletons with netherite swords (fire aspect II, no drop) |
| `load.mcfunction` | Declare `wData` scoreboard objective |

## New Files

| File | Purpose |
|---|---|
| `lifecycle/skull_wave.mcfunction` | 26 blue wither skulls in all directions, each carrying a radius-8 creeper |
| `midpoint/clearance.mcfunction` | 5 stacked creepers clearing a vertical shaft before archers spawn |
| `phase1/gravity_pull.mcfunction` | FallFlying player pull, 5s self-rescheduling loop |
| `phase1/skeleton_spawn.mcfunction` | Phase 1 skeleton wave controller, 15s self-rescheduling loop |
| `phase1/spawn_skel_group.mcfunction` | Summon 4 skeletons at player position, emerging from below |
| `phase3/wrath_aura.mcfunction` | Damage to far players, 1s self-rescheduling loop |
| `lifecycle/pursuit.mcfunction` | Teleport wither to player, lightning, halt motion |
| `lifecycle/pursuit_smite.mcfunction` | Delayed follow-up lightning + explosion |
| `lifecycle/despawn.mcfunction` | Explosions + kill wither |
| `lifecycle/forceload_remove.mcfunction` | Macro function — removes forceload at stored fight coordinates |

---

## Verification

1. `/reload`
2. Spawn explosion test: Summon ominous wither inside a room of obsidian — confirm fill removes obsidian in 6-block radius; confirm skull wave fires at 2s with ~26 blue skulls; confirm secondary radius-8 explosions at impact points
3. Clearance test: Summon ominous wither 20 blocks underground — reach midpoint, confirm vertical shaft is blasted open above the wither before any phantoms appear; confirm phantoms spawn into clear space
4. Phase 1 gravity pull: Equip elytra, glide within 40 blocks of wither — confirm pull every 5s yanks player down
5. Phase 1 skeletons: Stand within 150 blocks — confirm groups of 4 emerge near your position every 15s; stone swords, no drops
6. Phase 2 archer shield: Confirm wither glows and takes no damage while wither skeleton riders are alive; kill all riders — confirm wither invulnerability drops AND all phantom mounts die at the same moment
7. Phase 2 charge timing: Confirm charge begins at ~300 HP (not 250 HP)
8. Phase 3 resistance: Confirm 60% damage reduction; stand >16 blocks away, confirm 1 wither damage/second from aura
9. Phase 3 swarm: Confirm groups of 3 wither skeletons with netherite swords (fire aspect), 3× less often; swords don't drop
10. Flee test: Walk >150 blocks away — nausea at ~1s; wither teleports with lightning at ~3s; despawn at ~6s if still away
11. Chunk loading: With all players dead, confirm wither tick loop continues; confirm forceload removed after fight ends

---

## Implementation Status

- [ ] `ominous_init.mcfunction` — fill commands for bedrock/obsidian/crying obsidian at radius 6
- [ ] `ominous_init.mcfunction` — `schedule skull_wave 40t` added
- [ ] `lifecycle/skull_wave.mcfunction` — 26-skull wave file created
- [ ] `midpoint/midpoint.mcfunction` — `schedule clearance 1t` added (before blaze schedules)
- [ ] `midpoint/clearance.mcfunction` — vertical shaft file created
- [ ] `load.mcfunction` — `wData` scoreboard objective declared
- [ ] `ominous_init.mcfunction` — `forceload add ~ ~` at wither spawn + save coordinates to storage
- [ ] `ominous_init.mcfunction` — `schedule gravity_pull 15s` added
- [ ] `ominous_init.mcfunction` — `schedule skeleton_spawn 15s` added
- [ ] `ominous_init.mcfunction` — `schedule wrath_aura 20s` added
- [ ] `phase1/gravity_pull.mcfunction` — file created
- [ ] `phase1/skeleton_spawn.mcfunction` — file created
- [ ] `phase1/spawn_skel_group.mcfunction` — file created
- [ ] `5tick.mcfunction` — Archer Shield updated: condition → `type=wither_skeleton,tag=wArcher`; phantom kill added
- [ ] `5tick.mcfunction` — Phase 3 Resistance III (`amplifier:2`, no particles)
- [ ] `hit3.mcfunction` — charge thresholds changed from 260/250 to 298/298
- [ ] `phase3/wrath_aura.mcfunction` — file created
- [ ] `phase2/swarm.mcfunction` — reduced to 3 wither skeletons; netherite swords (fire aspect II, no drop)
- [ ] Swarm frequency timer — multiplied by 3× (verify current timer location and value)
- [ ] `tick.mcfunction` — flee counter + nausea (score 2) + pursuit (score 6) + despawn (score 12) added
- [ ] `tick.mcfunction` — `forceload add ~ ~` refresh added
- [ ] `lifecycle/pursuit.mcfunction` — file created
- [ ] `lifecycle/pursuit_smite.mcfunction` — file created
- [ ] `lifecycle/despawn.mcfunction` — file created
- [ ] `lifecycle/forceload_remove.mcfunction` — macro function created; called from cleanup
