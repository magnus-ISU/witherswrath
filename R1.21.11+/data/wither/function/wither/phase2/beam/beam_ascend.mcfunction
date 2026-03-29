# Beam Ascent - tp wither up 1.5 blocks/tick for 20 ticks
# Cancel beam if white-shield dive is active or NoAI is off (prevents overlapping attacks)
# Fixes symptom (overlapping) rather than root cause of simultaneous state triggers
execute if entity @e[type=wither,tag=ominousWither,tag=WhiteShieldDive] run return 0
execute as @e[type=wither,tag=ominousWither,limit=1] if data entity @s {NoAI:0b} run return 0

execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Move up
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run tp @s ~ ~1.5 ~

# Particle trail
execute at @e[type=wither,tag=ominousWither,limit=1] run particle lava ~ ~ ~ 0.5 0.5 0.5 1 10
execute at @e[type=wither,tag=ominousWither,limit=1] run particle soul_fire_flame ~ ~ ~ 0.3 0.3 0.3 0.05 5 force

# Increment timer
scoreboard players add ominousWither beamTimer 1

# Continue or transition to crystals
execute if score ominousWither beamTimer matches ..19 run schedule function wither:wither/phase2/beam/beam_ascend 1t
execute if score ominousWither beamTimer matches 20.. run function wither:wither/phase2/beam/beam_crystals
