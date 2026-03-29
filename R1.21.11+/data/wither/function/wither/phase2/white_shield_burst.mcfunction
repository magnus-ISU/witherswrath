# Spherical burst: dense core + layered clouds to ~16 blocks, then equatorial ring
execute at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:white_smoke ~ ~1 ~ 0 0 0 0.2 80 force
execute at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:white_smoke ~ ~1 ~ 4 4 4 0.05 350 force
execute at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:white_smoke ~ ~1 ~ 8 8 8 0.03 500 force
execute at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:white_smoke ~ ~1 ~ 12 12 12 0.02 400 force
execute at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:white_smoke ~ ~1 ~ 16 16 16 0.01 300 force
execute at @e[type=wither,tag=ominousWither,limit=1] run function wither:wither/phase2/proximity_white_ring
