# Don't dive during beam attack
execute if entity @e[type=wither,tag=ominousWither,tag=Beam] run return 0
# Don't dive during the MidpointAnimation
execute if entity @e[type=wither,tag=ominousWither,tag=MidpointAnimation] run return 0
# Don't dive during the Invulnerability phase
execute if entity @e[type=wither,tag=ominousWither,tag=Invul] run return 0
# Don't dive during a ground slam
execute if entity @e[type=wither,tag=ominousWither,tag=Slamming] run return 0
# Don't dive during white-shield dive wind-up
execute if entity @e[type=wither,tag=ominousWither,tag=WhiteShieldDive] run return 0
# Don't dive during spawning
execute unless entity @e[type=wither,tag=ominousWither,nbt={Invul:0}] run return 0

# Triggering player (nearest in dive volume — matches dive_entry)
execute at @s positioned ~-5 ~-300 ~-5 as @a[dx=10,dy=288,dz=10,sort=nearest,limit=1] at @s run effect give @s minecraft:slowness 6 0 true
execute at @s positioned ~-5 ~-300 ~-5 as @a[dx=10,dy=288,dz=10,sort=nearest,limit=1] at @s run particle minecraft:soul ~ ~1 ~ 0.55 1.65 0.55 0.15 155 force

tag @e[type=wither,tag=ominousWither,limit=1] add Diving
schedule function wither:wither/dive/dive_tick 40t
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:1b,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:200,show_particles:0b}]}
