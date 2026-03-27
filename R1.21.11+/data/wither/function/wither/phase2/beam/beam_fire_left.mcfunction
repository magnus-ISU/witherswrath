# Beam Fire - Left crystal (fires at each distinct target)
execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Always fire at center target (nearest player)
scoreboard players set #beam_steps beamStep 0
scoreboard players set #beam_spacing beamStep 0
scoreboard players set #beam_penetration beamStep 0
execute at @e[tag=beamCrystalL,limit=1] facing entity @e[tag=beamTargetCenter,limit=1] feet run function wither:wither/phase2/beam/beam_raycast

# Fire at left target if 2+ players
execute if score #beam_targets beamStep matches 2.. run scoreboard players set #beam_steps beamStep 0
execute if score #beam_targets beamStep matches 2.. run scoreboard players set #beam_spacing beamStep 0
execute if score #beam_targets beamStep matches 2.. run scoreboard players set #beam_penetration beamStep 0
execute if score #beam_targets beamStep matches 2.. at @e[tag=beamCrystalL,limit=1] facing entity @e[tag=beamTargetLeft,limit=1] feet run function wither:wither/phase2/beam/beam_raycast

# Fire at right target if 3 players
execute if score #beam_targets beamStep matches 3 run scoreboard players set #beam_steps beamStep 0
execute if score #beam_targets beamStep matches 3 run scoreboard players set #beam_spacing beamStep 0
execute if score #beam_targets beamStep matches 3 run scoreboard players set #beam_penetration beamStep 0
execute if score #beam_targets beamStep matches 3 at @e[tag=beamCrystalL,limit=1] facing entity @e[tag=beamTargetRight,limit=1] feet run function wither:wither/phase2/beam/beam_raycast

# Sound + particles
execute at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.wither.shoot hostile @a[distance=..150] ~ ~ ~ 2 0.5
execute at @e[tag=beamCrystalL,limit=1] run particle explosion ~ ~ ~ 0 0 0 1 5 force

# Schedule center fire 5t later
schedule function wither:wither/phase2/beam/beam_fire_center 5t
