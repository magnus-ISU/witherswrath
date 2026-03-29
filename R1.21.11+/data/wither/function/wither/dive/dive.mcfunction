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

tag @e[type=wither,tag=ominousWither,limit=1] add Diving
execute as @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.enderman.teleport hostile @a[distance=..150] ~ ~ ~ 1 1
schedule function wither:wither/dive/dive_tick 40t
execute as @e[type=wither,tag=ominousWither,limit=1] run data merge entity @s {NoAI:1b,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:200,show_particles:0b}]}
