# One-time 1s Resistance V + Glowing after proximity-shield ground slam; restore AI after slam
# Clear long-duration effects from dive start first
execute as @e[type=wither,tag=ominousWither,tag=ProximityShieldSlam,limit=1] run effect clear @s minecraft:resistance
execute as @e[type=wither,tag=ominousWither,tag=ProximityShieldSlam,limit=1] run effect clear @s minecraft:glowing

execute as @e[type=wither,tag=ominousWither,tag=ProximityShieldSlam,limit=1] run data merge entity @s {NoAI:0b,Glowing:1b,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:20,show_particles:0b,show_icon:1b},{id:"minecraft:glowing",amplifier:0,duration:20,show_particles:0b,show_icon:1b}]}
execute as @e[type=wither,tag=ominousWither,tag=ProximityShieldSlam,limit=1] run tag @s remove ProximityShieldSlam
schedule function wither:wither/phase2/init_proximity_shield 10t
