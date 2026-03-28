# Spawn 8 skeletons in a ring underneath the player with levitation (executed at each player's position)
# Half health (10 HP out of 20), stone swords, levitation to rise up
summon skeleton ~3 ~-1.9 ~1 {active_effects:[{id:levitation,amplifier:0,duration:50}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],attributes:[{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}],Health:11.0f}
summon skeleton ~3 ~-1.9 ~-1 {active_effects:[{id:levitation,amplifier:0,duration:50}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],attributes:[{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}],Health:11.0f}
summon skeleton ~-3 ~-1.9 ~1 {active_effects:[{id:levitation,amplifier:0,duration:50}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],attributes:[{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}],Health:11.0f}
summon skeleton ~-3 ~-1.9 ~-1 {active_effects:[{id:levitation,amplifier:0,duration:50}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],attributes:[{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}],Health:11.0f}
summon skeleton ~1 ~-1.9 ~3 {active_effects:[{id:levitation,amplifier:0,duration:50}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],attributes:[{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}],Health:11.0f}
summon skeleton ~1 ~-1.9 ~-3 {active_effects:[{id:levitation,amplifier:0,duration:50}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],attributes:[{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}],Health:11.0f}
summon skeleton ~-1 ~-1.9 ~3 {active_effects:[{id:levitation,amplifier:0,duration:50}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],attributes:[{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}],Health:11.0f}
summon skeleton ~-1 ~-1.9 ~-3 {active_effects:[{id:levitation,amplifier:0,duration:50}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],attributes:[{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}],Health:11.0f}

particle minecraft:squid_ink ~ ~-0.3 ~ 2 0.5 2 0.07 120 force
particle minecraft:smoke ~ ~-0.3 ~ 3 0.5 3 0.1 450 force

# Mark this player's position for the captain spawn 1s later
summon marker ~ ~ ~ {Tags:["wSpawnMarker"]}
