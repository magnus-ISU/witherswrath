
scoreboard players set enraged wenraged 1
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s remove Phase2
execute as @e[type=wither,tag=ominousWither,limit=1] run tag @s add Phase3
execute as @e[type=wither,tag=ominousWither,limit=1] run attribute @s minecraft:gravity base set 100
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run playsound entity.wither.death hostile @a[distance=..50] ~ ~ ~ 1 .3
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..50] ~ ~ ~ 1 2
team modify Wither color dark_red

function wither:wither/phase2/enraged/skulls/skulls

# Phase 3 transition: disable AI and strike lightning 10 times, then ground slam
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:1b}
scoreboard players set #lightning stages 0
schedule function wither:wither/phase2/enraged/lightning_tick 4t

# Start periodic ground check (every 10 seconds)
schedule function wither:wither/phase2/enraged/ground_check 200t
