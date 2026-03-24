
execute as @e[type=wither,tag=theWither,limit=1] at @s if entity @e[type=player,distance=..10] run function wither:wither/phase1/shift_away

execute if score witherCount witherCount matches 1.. if entity @e[type=wither,tag=theWither,scores={Health=301..600}] run schedule function wither:wither/phase1/check_player_tick 2t
execute if score witherCount witherCount matches 1.. unless entity @e[type=wither,tag=theWither] run schedule function wither:wither/phase1/check_player_tick 2t
