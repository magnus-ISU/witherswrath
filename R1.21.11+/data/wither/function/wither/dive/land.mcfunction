data merge entity @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] {NoAI:0b}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run summon minecraft:lightning_bolt ~ ~ ~ {}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run summon minecraft:creeper ~3 ~1 ~ {Team:"Wither",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run summon minecraft:creeper ~-3 ~1 ~ {Team:"Wither",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run summon minecraft:creeper ~ ~1 ~3 {Team:"Wither",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run summon minecraft:creeper ~ ~1 ~-3 {Team:"Wither",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run summon minecraft:creeper ~3 ~1 ~3 {Team:"Wither",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run summon minecraft:creeper ~-3 ~1 ~-3 {Team:"Wither",ExplosionRadius:4,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] run particle electric_spark ~ ~0.8 ~ 0.3 0.5 0.3 8 400 normal
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] run particle minecraft:end_rod ~ ~2 ~ 0 0 0 0.15 150 normal
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] as @e[type=player,distance=..100] run playsound minecraft:entity.wither.spawn hostile @e[type=player,distance=..100] ~ ~ ~ 1 .6
