# Phase 1 (600-300 HP): Spawn 8 skeletons around each player within 150 blocks
execute if entity @e[type=minecraft:wither,tag=ominousWither,scores={Health=300..600}] at @e[type=minecraft:wither,tag=ominousWither,limit=1] as @a[distance=..150] at @s run function wither:wither/passive/spawn_skeletons

# Phase 3 (<100 HP): Spawn 3 wither skeletons around the wither
execute if entity @e[type=minecraft:wither,tag=ominousWither,scores={Health=..99}] as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run function wither:wither/passive/spawn_wither_skeletons

# Reschedule based on phase
execute if entity @e[type=minecraft:wither,tag=ominousWither,scores={Health=300..600}] run schedule function wither:wither/passive/spawn 25s
execute if entity @e[type=minecraft:wither,tag=ominousWither,scores={Health=..99}] run schedule function wither:wither/passive/spawn 15s
# Keep checking during phase 2 (100-299 HP) so we catch the transition to phase 3
execute if entity @e[type=minecraft:wither,tag=ominousWither,scores={Health=100..299}] run schedule function wither:wither/passive/spawn 5s
