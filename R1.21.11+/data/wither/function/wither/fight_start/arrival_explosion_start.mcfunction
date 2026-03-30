# Executed as/at the wither (or any position for the blast center)
kill @e[type=armor_stand,tag=ArrivalExplosionAnchor]
summon minecraft:armor_stand ~ ~ ~ {Tags:["ArrivalExplosionAnchor"],Marker:1b,Invisible:1b,NoGravity:1b,Invulnerable:1b,Silent:1b}
execute at @e[type=armor_stand,tag=ArrivalExplosionAnchor,limit=1,sort=arbitrary] run summon creeper ~ ~-1 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:11b,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute at @e[type=armor_stand,tag=ArrivalExplosionAnchor,limit=1,sort=arbitrary] as @a[distance=..17] unless entity @s[nbt={active_effects:[{id:"minecraft:resistance"}]}] run tag @s add ClearResistance
schedule function wither:wither/fight_start/arrival_explosion_tick2 1t
schedule function wither:wither/fight_start/arrival_explosion_clear 3t
