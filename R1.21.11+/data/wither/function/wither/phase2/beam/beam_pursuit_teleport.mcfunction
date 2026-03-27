# Beam Pursuit Teleport - wither chases a fleeing beam target
# Teleports 30 blocks in the direction the fleeing target is facing + sphere explosion
# Only fires once per beam (BeamTeleport tag prevents re-triggering)

# Abort if all targets are within 150 blocks
execute at @e[type=wither,tag=ominousWither,limit=1] if entity @a[tag=beamTarget1,distance=..110] if entity @a[tag=beamTarget2,distance=..110] if entity @a[tag=beamTarget3,distance=..110] run return 0

# Teleport 30 blocks in the direction the fleeing target is facing
execute at @e[type=wither,tag=ominousWither,limit=1] as @a[tag=beamTarget1,distance=110..,limit=1] at @s run tp @e[type=wither,tag=ominousWither,limit=1] ^ ^ ^30
execute at @e[type=wither,tag=ominousWither,limit=1] as @a[tag=beamTarget2,distance=110..,limit=1] at @s run tp @e[type=wither,tag=ominousWither,limit=1] ^ ^ ^30
execute at @e[type=wither,tag=ominousWither,limit=1] as @a[tag=beamTarget3,distance=110..,limit=1] at @s run tp @e[type=wither,tag=ominousWither,limit=1] ^ ^ ^30

# Prevent repeated teleports this beam
tag @e[type=wither,tag=ominousWither] add BeamTeleport

# Bring crystals to new position
function wither:wither/phase2/beam/beam_crystals_follow

# Sphere explosion at arrival
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run function wither:wither/fight_start/init_sphere_summons

# Sound
execute at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.wither.spawn hostile @a[distance=..150] ~ ~ ~ 2 0.5
