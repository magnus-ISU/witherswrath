# Beam Fire - Left side head (first to fire, targets side player)
execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Reset raycast counters
scoreboard players set #beam_steps beamStep 0
scoreboard players set #beam_spacing beamStep 0

# Fire raycast from left crystal toward side target
execute at @e[tag=beamCrystalL,limit=1] facing entity @e[tag=beamTargetLeft,limit=1] feet run function wither:wither/phase2/beam/beamraycast

# Sound + particles
execute at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.wither.shoot hostile @a[distance=..150] ~ ~ ~ 2 0.5
execute at @e[tag=beamCrystalL,limit=1] run particle explosion ~ ~ ~ 0 0 0 1 5 force

# Schedule center fire 5t later
schedule function wither:wither/phase2/beam/beamfire_center 5t
