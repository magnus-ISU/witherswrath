# Second tick: lightning, multi-creeper ring, VFX (run at anchor / wither position)
summon minecraft:lightning_bolt ~ ~ ~
summon minecraft:creeper ~3 ~1 ~ {Team:"Wither",CustomName:"Ominous Wither's Dive",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon minecraft:creeper ~-3 ~1 ~ {Team:"Wither",CustomName:"Ominous Wither's Dive",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon minecraft:creeper ~ ~1 ~3 {Team:"Wither",CustomName:"Ominous Wither's Dive",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon minecraft:creeper ~ ~1 ~-3 {Team:"Wither",CustomName:"Ominous Wither's Dive",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon minecraft:creeper ~3 ~1 ~3 {Team:"Wither",CustomName:"Ominous Wither's Dive",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon minecraft:creeper ~-3 ~1 ~-3 {Team:"Wither",CustomName:"Ominous Wither's Dive",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
particle electric_spark ~ ~0.8 ~ 0.3 0.5 0.3 8 400 normal
particle minecraft:end_rod ~ ~2 ~ 0 0 0 0.15 150 normal
execute as @e[type=player,distance=..100] run playsound minecraft:entity.wither.spawn hostile @s ~ ~ ~ 1 .6
