# Dismount the wither and kill the armor stand
execute unless entity @e[type=armor_stand,tag=witherMount] run return 0
ride @e[type=wither,tag=ominousWither,limit=1] dismount
kill @e[type=armor_stand,tag=witherMount]
schedule function wither:wither/phase1/hover_cooldown 5s
