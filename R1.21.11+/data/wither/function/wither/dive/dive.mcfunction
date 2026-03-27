# Don't dive during beam attack
execute if entity @e[type=wither,tag=ominousWither,tag=Beam] run return 0

scoreboard players set ominousWither divecooldown 1
schedule function wither:wither/dive/divetick 20t
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:1b,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:200,show_particles:0b}]}
