# Spawns a swarm of Spellstorm Souls at every player's location (fall-immune)
execute as @a at @s run function wither:wither/phase2/spellstorm/swarm_summon_at_player

execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run playsound minecraft:entity.spider.step hostile @a ~ ~ ~ 1 1.5
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run playsound minecraft:entity.spider.step hostile @a ~ ~ ~ 1 1.6
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run playsound minecraft:entity.spider.step hostile @a ~ ~ ~ 1 1.4
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run playsound minecraft:entity.spider.step hostile @a ~ ~ ~ 1 1.8
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run playsound minecraft:entity.spider.step hostile @a ~ ~ ~ 1 1.3
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run playsound minecraft:entity.wither.break_block hostile @a ~ ~ ~ 1 .4

execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] at @s run particle minecraft:squid_ink ~ ~1 ~ 1 0.5 1 0.00000000005 100 normal

execute as @e[type=minecraft:wither,tag=ominousWither,limit=1] run tag @s remove Swarm

schedule clear wither:wither/phase2/spellstorm/spellstorm_soul_tick
execute if entity @e[type=wither_skeleton,tag=swarm] run schedule function wither:wither/phase2/spellstorm/spellstorm_soul_tick 9t
