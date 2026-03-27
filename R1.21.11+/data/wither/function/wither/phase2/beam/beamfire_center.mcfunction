# Beam Fire - Center head (fires 5t after left, targets center player)
execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Reset raycast counters
scoreboard players set #beam_steps beamStep 0
scoreboard players set #beam_spacing beamStep 0

# Fire raycast from center crystal toward center target
execute at @e[tag=beamCrystalC,limit=1] facing entity @e[tag=beamTargetCenter,limit=1] feet run function wither:wither/phase2/beam/beamraycast

# Sound + particles
execute at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.wither.shoot hostile @a[distance=..150] ~ ~ ~ 2 0.7
execute at @e[tag=beamCrystalC,limit=1] run particle explosion ~ ~ ~ 0 0 0 1 5 force

# Schedule right fire 5t later
schedule function wither:wither/phase2/beam/beamfire_right 5t
