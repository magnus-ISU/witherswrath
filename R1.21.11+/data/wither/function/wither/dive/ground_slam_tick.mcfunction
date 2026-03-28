# Check for ground before descending - land if block below feet is solid
execute as @e[type=wither,tag=ominousWither,tag=Slamming,limit=1] at @s unless block ~ ~-1 ~ minecraft:air run function wither:wither/dive/ground_slam_land
execute as @e[type=wither,tag=ominousWither,tag=Slamming,limit=1] at @s unless block ~ ~ ~ minecraft:air run function wither:wither/dive/ground_slam_land

# Descend and emit particles while still slamming
execute as @e[type=wither,tag=ominousWither,tag=Slamming,limit=1] at @s run tp @s ~ ~-2.5 ~
execute as @e[type=wither,tag=ominousWither,tag=Slamming,limit=1] at @s run particle poof ~ ~ ~ 0.5 0.5 0.5 0.1 20 normal

# Continue if still slamming
execute if entity @e[type=wither,tag=ominousWither,tag=Slamming] run schedule function wither:wither/dive/ground_slam_tick 1t
