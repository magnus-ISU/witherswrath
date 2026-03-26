# stuff for the rest of the datapack to work
scoreboard objectives add Health dummy
scoreboard objectives add wcharge1 dummy
scoreboard objectives add spawn dummy
scoreboard objectives add wticktime dummy
scoreboard objectives add wchargereset dummy
scoreboard objectives add wenraged dummy
scoreboard objectives add witherCheck dummy

team add Wither
team modify Wither nametagVisibility never
team modify Wither friendlyFire false

# ASTHETICS

# Set time to midnight and weather to thunderstorm when ominous wither is summoned
time set midnight
weather thunder

stopsound @a music
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run playsound minecraft:wither.10sec record @a[distance=..100] ~ ~ ~ 1 1
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run playsound minecraft:music.nether.basalt_deltas music @a[distance=..100] ~ ~-2 ~ 2
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @e[type=player,distance=..100] run playsound minecraft:entity.parrot.imitate.wither hostile @a ~ ~ ~ 2 0.1

# OPENING: clear 13x13x13, center blast, three 8-skull rings → creeper radius 6 at 4s
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:air
schedule function wither:wither/fight_start/init_sphere 1t
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run function wither:wither/fight_start/init_skull_rings
schedule function wither:wither/fight_start/init_ring_explode 4s

# ASCEND
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] if data storage wither:options {toggleanimation:Default} if entity @e[type=player,distance=..30] as @s at @s run particle sculk_soul ~ ~1 ~ 0.5 .35 0.5 0.1 50 normal
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] if data storage wither:options {toggleanimation:Default} run particle minecraft:sculk_soul ~ ~ ~ 15 0 15 0.000000000000000000001 1000 normal
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] if data storage wither:options {toggleanimation:Default} run particle dust_color_transition{from_color:[0.169,0.169,0.169],scale:4,to_color:[0.941,0.941,0.902]} ~ ~.8 ~ 0.9 1.2 0.9 0.001 100 normal
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] if data storage wither:options {toggleanimation:Default} run data merge entity @e[type=wither,tag=ominousWither,limit=1,sort=nearest] {active_effects:[{id:"minecraft:levitation",amplifier:3,duration:140,show_particles:0b},{id:"minecraft:slow_falling",amplifier:20,duration:400,show_particles:0b}]}
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] run team join Wither @s

# MODIFICATIONS
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] if data storage wither:options {toggleanimation:Default} run effect give @e[type=player,distance=..100] minecraft:darkness 8 1 true

execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run data merge entity @e[type=wither,tag=ominousWither,limit=1,sort=nearest] {Health:600f,Tags:["Bedrock","Charge","Phase1","Dash","Swarm","ominousWither"],equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":255},"minecraft:unbreakable":{}}},legs:{id:"minecraft:iron_leggings",count:1,components:{"minecraft:unbreakable":{},"minecraft:enchantments":{"minecraft:blast_protection":255}}},chest:{id:"minecraft:iron_chestplate",count:1,components:{"minecraft:unbreakable":{},"minecraft:enchantments":{"minecraft:blast_protection":255}}},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:unbreakable":{},"minecraft:enchantments":{"minecraft:blast_protection":255}}}},drop_chances:{mainhand:0,feet:0,legs:0,chest:0,head:0},attributes:[{id:"minecraft:follow_range",base:150},{id:"minecraft:knockback_resistance",base:0.5},{id:"minecraft:max_health",base:600},{id:"minecraft:movement_speed",base:0.8},{id:"minecraft:step_height",base:2},{id:"minecraft:explosion_knockback_resistance",base:0.9},{id:"minecraft:armor",base:1},{id:"minecraft:armor_toughness",base:0},{id:"minecraft:flying_speed",base:0}]}
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] if data storage wither:options {toggleanimation:Default} as @e[type=player,distance=..100] run attribute @s minecraft:gravity modifier add 1 0.05 add_value

scoreboard players set ominousWither divecooldown 0

