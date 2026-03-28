# Mount the wither on an invisible armor stand to lock it in place
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon armor_stand ~ ~-0.98 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Tags:["witherMount"],Team:"Wither"}
execute as @e[type=wither,tag=ominousWither,limit=1] run ride @s mount @e[type=armor_stand,tag=witherMount,limit=1]
tag @e[type=wither,tag=ominousWither,limit=1] add Hovering
