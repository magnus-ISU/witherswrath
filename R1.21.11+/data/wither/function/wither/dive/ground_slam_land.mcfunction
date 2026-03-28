# Ground slam landing - explosion and restore AI
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s remove Slamming
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:0b}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run function wither:wither/dive/dive_explosion
