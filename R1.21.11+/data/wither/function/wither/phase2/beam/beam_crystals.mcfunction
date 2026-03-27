# Beam Crystals - Summon crystals and aim markers
execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Reset timer for aim phase
scoreboard players set ominousWither beamTimer 0

# Lock wither rotation facing south, level
data merge entity @e[type=wither,tag=ominousWither,limit=1] {Rotation:[0f,0f]}

# Summon 3 ender crystals at wither head positions
execute at @e[type=wither,tag=ominousWither,limit=1] run summon end_crystal ~ ~4 ~ {ShowBottom:0b,Invulnerable:1b,beam_target:{X:0,Y:0,Z:0},Tags:["beamCrystalC"]}
execute at @e[type=wither,tag=ominousWither,limit=1] run summon end_crystal ~2 ~3 ~ {ShowBottom:0b,Invulnerable:1b,beam_target:{X:0,Y:0,Z:0},Tags:["beamCrystalR"]}
execute at @e[type=wither,tag=ominousWither,limit=1] run summon end_crystal ~-2 ~3 ~ {ShowBottom:0b,Invulnerable:1b,beam_target:{X:0,Y:0,Z:0},Tags:["beamCrystalL"]}

# Tag up to 3 nearest players as beam targets and count them
execute at @e[type=wither,tag=ominousWither,limit=1] run tag @a[distance=..150,gamemode=!spectator,sort=nearest,limit=1] add beamTarget1
execute at @e[type=wither,tag=ominousWither,limit=1] run tag @a[distance=..150,gamemode=!spectator,sort=nearest,limit=1,tag=!beamTarget1] add beamTarget2
execute at @e[type=wither,tag=ominousWither,limit=1] run tag @a[distance=..150,gamemode=!spectator,sort=nearest,limit=1,tag=!beamTarget1,tag=!beamTarget2] add beamTarget3

# Count distinct targets (1, 2, or 3) for fire functions
scoreboard players set #beam_targets beamStep 1
execute if entity @a[tag=beamTarget2,tag=!beamTarget1] run scoreboard players set #beam_targets beamStep 2
execute if entity @a[tag=beamTarget3,tag=!beamTarget1,tag=!beamTarget2] run scoreboard players set #beam_targets beamStep 3

# Fall back to nearest player if fewer than 3 targets
execute unless entity @a[tag=beamTarget2] as @a[tag=beamTarget1,limit=1] run tag @s add beamTarget2
execute unless entity @a[tag=beamTarget3] as @a[tag=beamTarget1,limit=1] run tag @s add beamTarget3

# Summon aim markers at target players + 213 blocks up
# Center head targets nearest, left targets 2nd nearest, right targets 3rd nearest
execute at @a[tag=beamTarget1,limit=1] run summon armor_stand ~ ~213 ~ {Team:"Wither",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Tags:["beamTargetCenter"]}
execute at @a[tag=beamTarget2,limit=1] run summon armor_stand ~ ~213 ~ {Team:"Wither",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Tags:["beamTargetLeft"]}
execute at @a[tag=beamTarget3,limit=1] run summon armor_stand ~ ~213 ~ {Team:"Wither",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Tags:["beamTargetRight"]}

# Set initial beam_target on crystals from marker Pos
data modify entity @e[tag=beamCrystalL,limit=1] beam_target set from entity @e[tag=beamTargetLeft,limit=1] Pos
data modify entity @e[tag=beamCrystalC,limit=1] beam_target set from entity @e[tag=beamTargetCenter,limit=1] Pos
data modify entity @e[tag=beamCrystalR,limit=1] beam_target set from entity @e[tag=beamTargetRight,limit=1] Pos

# Sound
execute at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..150] ~ ~ ~ 1 1.5

# Start aim tick
schedule function wither:wither/phase2/beam/beam_aim_tick 1t
