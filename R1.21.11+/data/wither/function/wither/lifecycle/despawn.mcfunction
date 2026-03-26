# Despawn wither when no players are within 150 blocks - executed as and at the wither
# Prevent normal death sequence from triggering
scoreboard players set witherCheck witherCheck 0

# Clear weather
weather clear

# Ring 1 (center): 1 creeper
summon creeper ~ ~ ~ {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:10}

# Ring 2 (radius 5): 6 creepers every 60 degrees
summon creeper ~0 ~ ~5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:6}
summon creeper ~4.33 ~ ~2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:6}
summon creeper ~4.33 ~ ~-2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:6}
summon creeper ~0 ~ ~-5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:6}
summon creeper ~-4.33 ~ ~-2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:6}
summon creeper ~-4.33 ~ ~2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:6}

# Ring 3 (radius 10): 14 creepers every 20 degrees
summon creeper ~0 ~ ~10 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~3.42 ~ ~9.4 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~6.43 ~ ~7.66 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~4.66 ~ ~5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~9.45 ~ ~1.74 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~9.45 ~ ~-1.74 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~4.66 ~ ~-5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~6.43 ~ ~-7.66 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~3.42 ~ ~-9.4 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~0 ~ ~-10 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-3.42 ~ ~-9.4 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-6.43 ~ ~-7.66 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-4.66 ~ ~-5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-9.45 ~ ~-1.74 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-9.45 ~ ~1.74 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-4.66 ~ ~5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-6.43 ~ ~7.66 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-3.42 ~ ~9.4 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
# Lower Ring 3
summon creeper ~0 ~-5 ~5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~4.33 ~-5 ~2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~4.33 ~-5 ~-2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~0 ~-5 ~-5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-4.33 ~-5 ~-2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-4.33 ~-5 ~2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
# Upper Ring 3
summon creeper ~0 ~5 ~5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~4.33 ~5 ~2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~4.33 ~5 ~-2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~0 ~5 ~-5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-4.33 ~5 ~-2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}
summon creeper ~-4.33 ~5 ~2.5 {CustomName:"Ominous Wither's Despawn",ignited:1b,Fuse:1,ExplosionRadius:4}

# Remove the wither without loot
tp @s ~ -200 ~
kill @s

# Clean up the fight
function wither:wither/fix
