execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:0b,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:200,show_particles:0b}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run function wither:wither/dive/dive_explosion
