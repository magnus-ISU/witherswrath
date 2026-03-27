# Teleport beam crystals to their positions relative to the wither
execute at @e[type=wither,tag=ominousWither,limit=1] run tp @e[tag=beamCrystalC,limit=1] ~ ~4 ~
execute at @e[type=wither,tag=ominousWither,limit=1] run tp @e[tag=beamCrystalR,limit=1] ~2 ~3 ~
execute at @e[type=wither,tag=ominousWither,limit=1] run tp @e[tag=beamCrystalL,limit=1] ~-2 ~3 ~
