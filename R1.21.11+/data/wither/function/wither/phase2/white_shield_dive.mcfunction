execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:1b,Glowing:1b,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:-1,show_particles:0b,show_icon:1b},{id:"minecraft:glowing",amplifier:0,duration:-1,show_particles:0b,show_icon:1b}]}
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s add WhiteShieldDive
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s add ProximityShieldSlam
execute at @e[type=wither,tag=ominousWither,limit=1] run function wither:wither/phase2/white_shield_burst
schedule function wither:wither/phase2/white_shield_slam 60t
