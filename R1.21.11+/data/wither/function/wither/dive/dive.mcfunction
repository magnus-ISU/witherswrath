scoreboard players set ominousWither divecooldown 12
schedule function wither:wither/dive/divetick 20t
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:1b,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:200,show_particles:0b}]}
