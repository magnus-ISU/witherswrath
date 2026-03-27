# Beam Aim Tick - runs every tick for 260 ticks
# Handles: circling (1-60), slow descent (61-160), medium descent (161-190), fast descent (191-210), lock-on (211-260)
execute unless entity @e[type=wither,tag=ominousWither] run return 0

scoreboard players add ominousWither beamTimer 1

# === TRACK SIDE TARGET XZ (keep marker Y) ===
execute if score ominousWither beamTimer matches 1..210 as @e[tag=beamTargetSide,limit=1] run data modify entity @s Pos[0] set from entity @a[tag=beamSideTarget,limit=1,gamemode=!spectator] Pos[0]
execute if score ominousWither beamTimer matches 1..210 as @e[tag=beamTargetSide,limit=1] run data modify entity @s Pos[2] set from entity @a[tag=beamSideTarget,limit=1,gamemode=!spectator] Pos[2]

# === TRACK CENTER TARGET XZ (keep marker Y) ===
execute if score ominousWither beamTimer matches 1..210 as @e[tag=beamTargetCenter,limit=1] run data modify entity @s Pos[0] set from entity @a[tag=beamCenterTarget,limit=1,gamemode=!spectator] Pos[0]
execute if score ominousWither beamTimer matches 1..210 as @e[tag=beamTargetCenter,limit=1] run data modify entity @s Pos[2] set from entity @a[tag=beamCenterTarget,limit=1,gamemode=!spectator] Pos[2]

# === CIRCLE PHASE (ticks 1-60): 12 positions, 15-block radius, 5 ticks each ===
# Side markers
execute if score ominousWither beamTimer matches 1..5 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~15 ~ ~0
execute if score ominousWither beamTimer matches 6..10 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~13 ~ ~7.5
execute if score ominousWither beamTimer matches 11..15 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~7.5 ~ ~13
execute if score ominousWither beamTimer matches 16..20 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~0 ~ ~15
execute if score ominousWither beamTimer matches 21..25 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~-7.5 ~ ~13
execute if score ominousWither beamTimer matches 26..30 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~-13 ~ ~7.5
execute if score ominousWither beamTimer matches 31..35 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~-15 ~ ~0
execute if score ominousWither beamTimer matches 36..40 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~-13 ~ ~-7.5
execute if score ominousWither beamTimer matches 41..45 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~-7.5 ~ ~-13
execute if score ominousWither beamTimer matches 46..50 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~0 ~ ~-15
execute if score ominousWither beamTimer matches 51..55 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~7.5 ~ ~-13
execute if score ominousWither beamTimer matches 56..60 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~13 ~ ~-7.5
# Center markers (offset by 180 degrees for visual variety)
execute if score ominousWither beamTimer matches 1..5 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~-15 ~ ~0
execute if score ominousWither beamTimer matches 6..10 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~-13 ~ ~-7.5
execute if score ominousWither beamTimer matches 11..15 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~-7.5 ~ ~-13
execute if score ominousWither beamTimer matches 16..20 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~0 ~ ~-15
execute if score ominousWither beamTimer matches 21..25 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~7.5 ~ ~-13
execute if score ominousWither beamTimer matches 26..30 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~13 ~ ~-7.5
execute if score ominousWither beamTimer matches 31..35 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~15 ~ ~0
execute if score ominousWither beamTimer matches 36..40 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~13 ~ ~7.5
execute if score ominousWither beamTimer matches 41..45 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~7.5 ~ ~13
execute if score ominousWither beamTimer matches 46..50 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~0 ~ ~15
execute if score ominousWither beamTimer matches 51..55 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~-7.5 ~ ~13
execute if score ominousWither beamTimer matches 56..60 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~-13 ~ ~7.5

# === SLOW DESCENT (ticks 61-160): 0.5 blocks/tick down ===
execute if score ominousWither beamTimer matches 61..160 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~ ~-0.5 ~
execute if score ominousWither beamTimer matches 61..160 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~ ~-0.5 ~

# === MEDIUM DESCENT (ticks 161-190): 1 block/tick down ===
execute if score ominousWither beamTimer matches 161..190 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~ ~-1 ~
execute if score ominousWither beamTimer matches 161..190 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~ ~-1 ~

# === FAST DESCENT (ticks 191-210): 2 blocks/tick down ===
execute if score ominousWither beamTimer matches 191..210 as @e[tag=beamTargetSide,limit=1] at @s run tp @s ~ ~-2 ~
execute if score ominousWither beamTimer matches 191..210 as @e[tag=beamTargetCenter,limit=1] at @s run tp @s ~ ~-2 ~

# === LOCK ON (ticks 211-260): tp markers directly to target player ===
execute if score ominousWither beamTimer matches 211..260 as @e[tag=beamTargetSide,limit=1] run tp @s @a[tag=beamSideTarget,limit=1,gamemode=!spectator]
execute if score ominousWither beamTimer matches 211..260 as @e[tag=beamTargetCenter,limit=1] run tp @s @a[tag=beamCenterTarget,limit=1,gamemode=!spectator]

# === UPDATE CRYSTAL BEAM TARGETS ===
# Side crystals (L and R) point to beamTargetSide
data modify entity @e[tag=beamCrystalL,limit=1] beam_target set from entity @e[tag=beamTargetSide,limit=1] Pos
data modify entity @e[tag=beamCrystalR,limit=1] beam_target set from entity @e[tag=beamTargetSide,limit=1] Pos

# Center crystal points to beamTargetCenter
data modify entity @e[tag=beamCrystalC,limit=1] beam_target set from entity @e[tag=beamTargetCenter,limit=1] Pos

# === PARTICLES AT BEAM ENDPOINTS ===
execute at @e[tag=beamTargetSide,limit=1] run particle end_rod ~ ~ ~ 0.5 0.5 0.5 0 5 force
execute at @e[tag=beamTargetCenter,limit=1] run particle end_rod ~ ~ ~ 0.5 0.5 0.5 0 5 force

# === SOUND CUES (escalating as beam descends) ===
execute if score ominousWither beamTimer matches 60 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.5 0.5
execute if score ominousWither beamTimer matches 100 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.5 0.7
execute if score ominousWither beamTimer matches 140 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.5 0.9
execute if score ominousWither beamTimer matches 180 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.5 1.1
execute if score ominousWither beamTimer matches 200 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.7 1.3
execute if score ominousWither beamTimer matches 210 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 1.0 1.5

# === CONTINUE OR FIRE ===
execute if score ominousWither beamTimer matches ..259 run schedule function wither:wither/phase2/beam/beamaimtick 1t
execute if score ominousWither beamTimer matches 260.. run function wither:wither/phase2/beam/beamfire_left
