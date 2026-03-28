# Initiate a ground slam - wither descends rapidly and explodes on landing
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s add Slamming
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:1b,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:200,show_particles:0b}]}
schedule function wither:wither/dive/ground_slam_tick 1t
