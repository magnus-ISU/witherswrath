# Spherical explosion — second tick of arrival sequence (after Resistance V); creepers on a sphere
# Executed at the blast anchor (called from arrival_explosion_tick2)
# The fill command clears a 13x13x13 cube; these creepers carve the edges into a sphere

# Center
summon creeper ~ ~-1 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}

# Poles (top and bottom of sphere, radius 9)
summon creeper ~ ~8 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~-10 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}

# Equator ring (Y+1, radius 9, 12 points every 30 degrees)
summon creeper ~9 ~-1 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~7.79 ~-1 ~4.5 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~4.5 ~-1 ~7.79 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~-1 ~9 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-4.5 ~-1 ~7.79 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-7.79 ~-1 ~4.5 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-9 ~-1 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-7.79 ~-1 ~-4.5 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-4.5 ~-1 ~-7.79 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~-1 ~-9 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~4.5 ~-1 ~-7.79 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~7.79 ~-1 ~-4.5 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}

# Upper mid ring (Y+6, radius 6.7, 8 points every 45 degrees)
summon creeper ~6.7 ~5 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~4.74 ~5 ~4.74 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~5 ~6.7 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-4.74 ~5 ~4.74 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-6.7 ~5 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-4.74 ~5 ~-4.74 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~5 ~-6.7 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~4.74 ~5 ~-4.74 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}

# Lower mid ring (Y-5, radius 6.7, 8 points every 45 degrees)
summon creeper ~6.7 ~-6 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~4.74 ~-6 ~4.74 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~-6 ~6.7 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-4.74 ~-6 ~4.74 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-6.7 ~-6 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-4.74 ~-6 ~-4.74 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~-6 ~-6.7 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~4.74 ~-6 ~-4.74 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}

# Upper cap ring (Y+9, radius 3, 4 points)
summon creeper ~3 ~8 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-3 ~8 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~8 ~3 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~8 ~-3 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}

# Lower cap ring (Y-7, radius 3, 4 points)
summon creeper ~3 ~-8 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~-3 ~-8 ~ {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~-8 ~3 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
summon creeper ~ ~-8 ~-3 {Team:"Wither",CustomName:"Ominous Wither's Arrival",ExplosionRadius:6,Invulnerable:1b,Fuse:0,ignited:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:0.0625}]}
