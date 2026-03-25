# Skeleton variants to Wither Skeletons
execute at @e[type=wither,tag=ominousWither,limit=1,sort=nearest] as @e[type=#minecraft:skeletons,distance=..20,tag=] unless data entity @s CustomName run tag @s add sMarked

execute at @e[type=wither,tag=ominousWither,limit=1,sort=nearest] as @e[nbt={Tags:["sMarked"]}] at @s run summon wither_skeleton ~ ~.01 ~ {Team:"Wither",DeathLootTable: "wither:entities/withermobs", Tags: ["wSkel"], attributes: [{id: "max_health", base: 15}], Health: 15, equipment:{mainhand:{id:"minecraft:bow",count:1,components:{"minecraft:item_name":"Ancient Bow"}},feet:{id:"minecraft:netherite_boots",count:1,components:{"minecraft:unbreakable":{},"minecraft:trim":{material:"minecraft:diamond",pattern:"minecraft:silence"}}}},drop_chances:{feet:0.000,mainhand:0.000}}

execute at @e[type=wither,tag=ominousWither,limit=1,sort=nearest] as @e[nbt={Tags:["sMarked"]}] run data merge entity @s {Silent:1b,DeathLootTable:"wither:entities/withermobs",equipment:{head:{id:"minecraft:bone",count:1}},active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:20,show_particles:0b}]}

execute at @e[type=wither,tag=ominousWither,limit=1,sort=nearest] as @e[nbt={Tags:["sMarked"]}] run kill @s

execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:wither/passive/convert 2s

