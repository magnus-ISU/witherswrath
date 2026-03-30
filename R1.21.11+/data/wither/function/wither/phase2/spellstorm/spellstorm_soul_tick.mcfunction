execute unless entity @e[type=wither_skeleton,tag=swarm] run return 0
execute unless entity @e[type=wither,tag=ominousWither] run return 0
execute as @e[type=wither_skeleton,tag=swarm,sort=random,limit=1] at @s run function wither:wither/phase2/spellstorm/spellstorm_soul_relocate
