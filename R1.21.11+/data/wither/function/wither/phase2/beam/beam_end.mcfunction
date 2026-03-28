# Beam Attack Cleanup
# Kill crystals
kill @e[tag=beamCrystalL]
kill @e[tag=beamCrystalC]
kill @e[tag=beamCrystalR]

# Kill aim markers
kill @e[tag=beamTargetLeft]
kill @e[tag=beamTargetCenter]
kill @e[tag=beamTargetRight]

# Kill lock markers (release players)
kill @e[type=marker,tag=beamLock1]
kill @e[type=marker,tag=beamLock2]
kill @e[type=marker,tag=beamLock3]

# Remove player target tags
tag @a remove beamTarget1
tag @a remove beamTarget2
tag @a remove beamTarget3

# Restore wither
tag @e[type=wither,tag=ominousWither] remove Beam
tag @e[type=wither,tag=ominousWither] remove BeamTeleport
data merge entity @e[type=wither,tag=ominousWither,limit=1] {NoAI:0b,Glowing:0b}

# Schedule next beam attack in 60 seconds
execute if entity @e[type=wither,tag=ominousWither,scores={Health=100..}] run schedule function wither:wither/phase2/beam/beam_pre 60s
