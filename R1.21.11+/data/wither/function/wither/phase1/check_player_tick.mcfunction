
execute as @e[type=wither,tag=ominousWither,limit=1] at @s if entity @e[type=player,distance=..20] run function wither:wither/phase1/shift_away

execute if entity @e[type=wither,tag=ominousWither] if entity @e[type=wither,tag=ominousWither,scores={Health=301..600}] run schedule function wither:wither/phase1/check_player_tick 2t
execute if entity @e[type=wither,tag=ominousWither] unless entity @e[type=wither,tag=ominousWither] run schedule function wither:wither/phase1/check_player_tick 2t
