# Beam Aim Tick - runs every tick for 260 ticks
# Dispatches to aim sub-functions, updates crystals, particles, and sound cues
execute unless entity @e[type=wither,tag=ominousWither] run return 0

scoreboard players add ominousWither beamTimer 1

# === DISPATCH LEFT BEAM (targets side player) ===
execute if score ominousWither beamTimer matches 1..50 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/left_beam_aim_1_to_50
execute if score ominousWither beamTimer matches 51..100 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/left_beam_aim_51_to_100
execute if score ominousWither beamTimer matches 101..150 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/left_beam_aim_101_to_150
execute if score ominousWither beamTimer matches 151..200 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/left_beam_aim_151_to_200
execute if score ominousWither beamTimer matches 201..260 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/left_beam_aim_locked

# === DISPATCH CENTER BEAM (targets center player) ===
execute if score ominousWither beamTimer matches 1..50 as @a[tag=beamCenterTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/center_beam_aim_1_to_50
execute if score ominousWither beamTimer matches 51..100 as @a[tag=beamCenterTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/center_beam_aim_51_to_100
execute if score ominousWither beamTimer matches 101..150 as @a[tag=beamCenterTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/center_beam_aim_101_to_150
execute if score ominousWither beamTimer matches 151..200 as @a[tag=beamCenterTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/center_beam_aim_151_to_200
execute if score ominousWither beamTimer matches 201..260 as @a[tag=beamCenterTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/center_beam_aim_locked

# === DISPATCH RIGHT BEAM (targets side player) ===
execute if score ominousWither beamTimer matches 1..50 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/right_beam_aim_1_to_50
execute if score ominousWither beamTimer matches 51..100 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/right_beam_aim_51_to_100
execute if score ominousWither beamTimer matches 101..150 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/right_beam_aim_101_to_150
execute if score ominousWither beamTimer matches 151..200 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/right_beam_aim_151_to_200
execute if score ominousWither beamTimer matches 201..260 as @a[tag=beamSideTarget,limit=1,gamemode=!spectator] at @s run function wither:wither/phase2/beam/aim/right_beam_aim_locked

# === UPDATE CRYSTAL BEAM TARGETS ===
data modify entity @e[tag=beamCrystalL,limit=1] beam_target set from entity @e[tag=beamTargetLeft,limit=1] Pos
data modify entity @e[tag=beamCrystalC,limit=1] beam_target set from entity @e[tag=beamTargetCenter,limit=1] Pos
data modify entity @e[tag=beamCrystalR,limit=1] beam_target set from entity @e[tag=beamTargetRight,limit=1] Pos

# === PARTICLES AT BEAM ENDPOINTS ===
execute at @e[tag=beamTargetLeft,limit=1] run particle end_rod ~ ~ ~ 0.5 0.5 0.5 0 5 force
execute at @e[tag=beamTargetCenter,limit=1] run particle end_rod ~ ~ ~ 0.5 0.5 0.5 0 5 force
execute at @e[tag=beamTargetRight,limit=1] run particle end_rod ~ ~ ~ 0.5 0.5 0.5 0 5 force

# === SOUND CUES (escalating as beam descends) ===
#execute if score ominousWither beamTimer matches 60 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.5 0.5
#execute if score ominousWither beamTimer matches 100 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.5 0.7
#execute if score ominousWither beamTimer matches 140 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.5 0.9
#execute if score ominousWither beamTimer matches 180 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.5 1.1
#execute if score ominousWither beamTimer matches 200 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 0.7 1.3
#execute if score ominousWither beamTimer matches 210 at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.experience_orb.pickup player @a[distance=..150] ~ ~ ~ 1.0 1.5

# === CONTINUE OR FIRE ===
execute if score ominousWither beamTimer matches ..259 run schedule function wither:wither/phase2/beam/beam_aim_tick 1t
execute if score ominousWither beamTimer matches 260.. run function wither:wither/phase2/beam/beamfire_left
