# Spawn a skeleton captain at each marker left where players were standing
execute as @e[type=marker,tag=wSpawnMarker] at @s run summon skeleton ~ ~-1.9 ~ {active_effects:[{id:levitation,amplifier:0,duration:50},{id:"minecraft:resistance",amplifier:4,duration:50,show_particles:0b},{id:"minecraft:strength",amplifier:1,duration:-1,show_particles:0b},{id:"minecraft:speed",amplifier:1,duration:-1,show_particles:0b}],Team:"Wither",DeathLootTable:"wither:entities/withermobs",Tags:["wSkel"],equipment:{head:{id:"minecraft:golden_helmet",count:1,components:{"minecraft:unbreakable":{},"minecraft:enchantments":{"minecraft:blast_protection":10,"minecraft:protection":4}}},mainhand:{id:"minecraft:stone_sword",count:1}},drop_chances:{head:0,mainhand:0},attributes:[{id:"minecraft:max_health",base:20},{id:"minecraft:safe_fall_distance",base:100},{id:"minecraft:follow_range",base:128}]}

# Clean up markers
kill @e[type=marker,tag=wSpawnMarker]
