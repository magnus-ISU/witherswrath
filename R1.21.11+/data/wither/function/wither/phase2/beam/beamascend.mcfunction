# Beam Ascent - tp wither up 1.5 blocks/tick for 20 ticks
execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Move up
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run tp @s ~ ~1.5 ~

# Particle trail
execute at @e[type=wither,tag=ominousWither,limit=1] run particle lava ~ ~ ~ 0.5 0.5 0.5 1 10
execute at @e[type=wither,tag=ominousWither,limit=1] run particle soul_fire_flame ~ ~ ~ 0.3 0.3 0.3 0.05 5 force

# Increment timer
scoreboard players add ominousWither beamTimer 1

# Continue or transition to crystals
execute if score ominousWither beamTimer matches ..19 run schedule function wither:wither/phase2/beam/beamascend 1t
execute if score ominousWither beamTimer matches 20.. run function wither:wither/phase2/beam/beamcrystals
