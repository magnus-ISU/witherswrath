# for the absorption particles thingy (trails)

function wither:wither/fight_start/pre_part_trail

execute if entity @e[type=minecraft:wither_skull,tag=fightInitSkull] run function wither:wither/fight_start/init_skull_tick

schedule function wither:wither/fight_start/tick 1t
