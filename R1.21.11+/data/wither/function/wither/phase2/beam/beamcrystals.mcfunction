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

# Tag target players
# Side heads: both target nearest player
execute at @e[type=wither,tag=ominousWither,limit=1] run tag @p[distance=..150,gamemode=!spectator] add beamSideTarget
# Center head: target random player (could be same in singleplayer)
execute at @e[type=wither,tag=ominousWither,limit=1] run tag @r[distance=..150,gamemode=!spectator] add beamCenterTarget

# Summon aim markers at target players + 120 blocks up
execute at @a[tag=beamSideTarget,limit=1] run summon armor_stand ~ ~120 ~ {Team:"Wither",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Tags:["beamTargetSide"]}
execute at @a[tag=beamCenterTarget,limit=1] run summon armor_stand ~ ~120 ~ {Team:"Wither",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Tags:["beamTargetCenter"]}

# Set initial beam_target on crystals from marker Pos
data modify entity @e[tag=beamCrystalL,limit=1] beam_target set from entity @e[tag=beamTargetSide,limit=1] Pos
data modify entity @e[tag=beamCrystalR,limit=1] beam_target set from entity @e[tag=beamTargetSide,limit=1] Pos
data modify entity @e[tag=beamCrystalC,limit=1] beam_target set from entity @e[tag=beamTargetCenter,limit=1] Pos

# Sound
execute at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..150] ~ ~ ~ 1 1.5

# Start aim tick
schedule function wither:wither/phase2/beam/beamaimtick 1t
