# Executed as/at the wither — multi-tick sequence to avoid same-tick totem + death from stacked creeper damage
kill @e[type=armor_stand,tag=DiveExplosionAnchor]
summon minecraft:armor_stand ~ ~ ~ {Tags:["DiveExplosionAnchor"],Marker:1b,Invisible:1b,NoGravity:1b,Invulnerable:1b,Silent:1b}
execute at @e[type=armor_stand,tag=DiveExplosionAnchor,limit=1,sort=arbitrary] run summon minecraft:creeper ~ ~1 ~ {Team:"Wither",CustomName:"Ominous Wither's Dive",ExplosionRadius:6b,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute at @e[type=armor_stand,tag=DiveExplosionAnchor,limit=1,sort=arbitrary] as @a[distance=..13] unless entity @s[nbt={active_effects:[{id:"minecraft:resistance"}]}] run tag @s add ClearResistance
schedule function wither:wither/dive/dive_explosion_tick2 1t
schedule function wither:wither/dive/dive_explosion_clear 3t
