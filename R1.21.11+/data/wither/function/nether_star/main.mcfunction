# Remove vanilla nether star drop near death position
execute at @e[type=marker,tag=witherDeathPos,limit=1] run kill @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..10,tag=!OminousNetherStar]

# Default animation: summon display (vehicle) with nether star item as passenger
execute if data storage wither:options {toggleanimation:Default} at @e[type=marker,tag=witherDeathPos,limit=1] run summon item_display ~ ~ ~ {NoGravity:1b,Glowing:1b,Tags:["nether_star","ns_new_display"],glow_color_override:16777215,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.8f,0f],scale:[1.5f,1.5f,1.5f]},item:{id:"minecraft:nether_star",count:1}}
execute if data storage wither:options {toggleanimation:Default} as @e[type=item_display,tag=ns_new_display,limit=1] at @s unless block ~ ~-0.7 ~ air run tp @s ~ ~.75 ~
execute if data storage wither:options {toggleanimation:Default} at @e[type=item_display,tag=ns_new_display,limit=1] run summon item ~ ~ ~ {PickupDelay:20,Invulnerable:1b,NoGravity:1b,Tags:["OminousNetherStar","ns_new"],Item:{id:"minecraft:nether_star",count:1}}
execute if data storage wither:options {toggleanimation:Default} run ride @e[type=item,tag=ns_new,limit=1] mount @e[type=item_display,tag=ns_new_display,limit=1]
tag @e[tag=ns_new_display] remove ns_new_display

# XP armor stand
execute if data storage wither:options {toggleanimation:Default} at @e[type=item,tag=ns_new,limit=1] run summon armor_stand ~ ~ ~ {Team:"Wither",Invisible:1b,Invulnerable:1b,NoGravity:1b,Tags:["starxp"]}

# Trophy
execute if data storage wither:options {toggletrophy:Enabled} at @e[type=item,tag=ns_new,limit=1] run function wither:nether_star/trophy

# Bedrock animation: just give upward motion, no display
execute if data storage wither:options {toggleanimation:Bedrock} at @e[type=marker,tag=witherDeathPos,limit=1] run summon item ~ ~ ~ {Motion:[0.0,0.1,0.0],Tags:["OminousNetherStar","ns_new"],Item:{id:"minecraft:nether_star",count:1}}

# Clean up marker
kill @e[type=marker,tag=witherDeathPos]

# EFFECTS
execute as @e[type=item,tag=ns_new] at @s as @e[type=item,distance=..10] run data merge entity @s {Invulnerable:1b}
execute as @e[type=item,tag=ns_new] at @s run playsound minecraft:wither.death hostile @a ~ ~ ~ 1 1
execute as @e[type=item,tag=ns_new] at @s if data storage wither:options {toggleanimation:Default} run particle minecraft:soul ~ ~ ~ 0 0.5 0 0.07 220 normal
execute as @e[type=item,tag=ns_new] at @s if data storage wither:options {toggleanimation:Default} run particle minecraft:soul ~ ~1 ~ 0 1 0 0.04 80 normal
execute as @e[type=item,tag=ns_new] at @s run playsound minecraft:particle.soul_escape master @e[type=player,distance=..100] ~ ~ ~ 100 0.1 1
execute as @e[type=item,tag=ns_new] at @s run playsound minecraft:particle.soul_escape master @e[type=player,distance=..100] ~ ~ ~ 30 1 1
execute as @e[type=item,tag=ns_new] at @s run playsound minecraft:particle.soul_escape master @e[type=player,distance=..100] ~ ~ ~ 30 1 1
execute as @e[type=item,tag=ns_new] at @s if data storage wither:options {toggleanimation:Default} run playsound entity.lightning_bolt.thunder ambient @e[type=player,distance=..50] ~ ~ ~ 1 .3
tag @e[tag=ns_new] remove ns_new

# Start tick loop
execute if data storage wither:options {toggleanimation:Default} run function wither:nether_star/tick
