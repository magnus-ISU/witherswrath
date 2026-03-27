# Beam Fire - Right side head (fires 10t after left, targets same side player)
execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Reset raycast counters
scoreboard players set #beam_steps beamStep 0
scoreboard players set #beam_spacing beamStep 0

# Fire raycast from right crystal toward side target (same as left)
execute at @e[tag=beamCrystalR,limit=1] facing entity @e[tag=beamTargetSide,limit=1] feet run function wither:wither/phase2/beam/beamraycast

# Sound + particles
execute at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.wither.shoot hostile @a[distance=..150] ~ ~ ~ 2 0.9
execute at @e[tag=beamCrystalR,limit=1] run particle explosion ~ ~ ~ 0 0 0 1 5 force

# Schedule cleanup
schedule function wither:wither/phase2/beam/beamend 10t
