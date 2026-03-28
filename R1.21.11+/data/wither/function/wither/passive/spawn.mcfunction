# Phase 1 (600-300 HP): Spawn 8 skeletons around each player within 150 blocks
# Uses Wither tag instead of health score since health can briefly spike above 300
execute if entity @e[type=minecraft:wither,tag=ominousWither,tag=Phase1] at @e[type=minecraft:wither,tag=ominousWither,limit=1] as @a[distance=..150] at @s run function wither:wither/passive/spawn_skeletons
execute if entity @e[type=minecraft:wither,tag=ominousWither,tag=Phase1] run schedule function wither:wither/passive/spawn_captain 1s

# Phase 3 (<100 HP): Spawn 3 wither skeletons around the wither
execute if entity @e[type=minecraft:wither,tag=ominousWither,scores={Health=..99}] as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run function wither:wither/passive/spawn_wither_skeletons

# Reschedule based on phase
execute if entity @e[type=minecraft:wither,tag=ominousWither,tag=Phase1] run schedule function wither:wither/passive/spawn 32s
execute if entity @e[type=minecraft:wither,tag=ominousWither,scores={Health=..99}] run schedule function wither:wither/passive/spawn 16s
# Keep checking during phase 2 so we catch the transition to phase 3
execute if entity @e[type=minecraft:wither,tag=ominousWither,tag=Phase2,scores={Health=100..}] run schedule function wither:wither/passive/spawn 16s
