# Scheduled 1t after fill to carve cube edges into a sphere
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run function wither:wither/fight_start/init_sphere_summons
