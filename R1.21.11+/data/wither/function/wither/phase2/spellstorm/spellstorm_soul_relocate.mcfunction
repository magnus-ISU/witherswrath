# @s = Spellstorm Soul. Reschedules spellstorm_soul_tick: 1t (skip / bad landing), 9t (teleport ok), 100t (anchor struck by lightning).
# Edit the schedule lines to change delays.

execute if entity @a[distance=..40] run schedule function wither:wither/phase2/spellstorm/spellstorm_soul_tick 1t
execute if entity @a[distance=..40] run return 0

execute unless entity @e[type=wither,tag=ominousWither,limit=1] run return 0

execute at @e[type=wither,tag=ominousWither,limit=1] as @a[sort=nearest,limit=1,distance=..150] run tag @s add spellstormTarget
execute unless entity @a[tag=spellstormTarget,limit=1] run schedule function wither:wither/phase2/spellstorm/spellstorm_soul_tick 9t
execute unless entity @a[tag=spellstormTarget,limit=1] run return 0

tag @a[tag=spellstormTarget] remove spellstormGrounded
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-1 ~ #minecraft:air run tag @s add spellstormGrounded
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-2 ~ #minecraft:air run tag @s add spellstormGrounded
execute as @a[tag=spellstormTarget,limit=1] at @s unless block ~ ~-3 ~ #minecraft:air run tag @s add spellstormGrounded

execute unless entity @e[type=marker,tag=spellstormSwarmMarker,limit=1] at @e[type=wither,tag=ominousWither,limit=1] run summon marker ~ ~ ~ {Tags:["spellstormSwarmMarker"]}
execute as @a[tag=spellstormTarget,limit=1] at @s run tp @e[type=marker,tag=spellstormSwarmMarker,limit=1] ~ ~ ~
execute as @e[type=marker,tag=spellstormSwarmMarker,limit=1] at @s run spreadplayers ~ ~ 0 8 false @s
execute as @a[tag=spellstormTarget,limit=1] run data modify entity @e[type=marker,tag=spellstormSwarmMarker,limit=1] Pos[1] set from entity @s Pos[1]

execute as @e[type=marker,tag=spellstormSwarmMarker,limit=1] at @s unless block ~ ~-1 ~ #minecraft:air if block ~ ~ ~ #minecraft:air if block ~ ~1 ~ #minecraft:air if block ~ ~2 ~ #minecraft:air align xz positioned ~0.5 ~ ~0.5 run tp @s ~ ~ ~

execute as @e[type=marker,tag=spellstormSwarmMarker,limit=1] at @s if block ~ ~-1 ~ #minecraft:air run spreadplayers ~ ~ 0 2 false @s

execute as @e[type=marker,tag=spellstormSwarmMarker,limit=1] at @s if entity @a[tag=spellstormTarget,distance=..5] run return run function wither:wither/phase2/spellstorm/spellstorm_soul_cancel_near

execute as @a[tag=spellstormTarget,limit=1,tag=!spellstormGrounded] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @a[tag=spellstormTarget,limit=1,tag=!spellstormGrounded] run tag @s add spellstormPlayerLit

execute at @e[type=marker,tag=spellstormSwarmMarker,limit=1] run summon minecraft:lightning_bolt ~ ~ ~

data merge entity @s {active_effects:[{id:"minecraft:instant_damage",amplifier:4,duration:1,show_particles:0b,show_icon:0b},{id:"minecraft:regeneration",amplifier:1,duration:200,show_particles:0b,show_icon:0b}]}

execute at @e[type=marker,tag=spellstormSwarmMarker,limit=1] run tp @s ~ ~ ~
execute as @s at @s run spreadplayers ~ ~ 0 2 false @s

execute if entity @a[tag=spellstormPlayerLit,limit=1] run schedule function wither:wither/phase2/spellstorm/spellstorm_soul_tick 100t
execute unless entity @a[tag=spellstormPlayerLit,limit=1] run schedule function wither:wither/phase2/spellstorm/spellstorm_soul_tick 9t

tag @a remove spellstormTarget
tag @a remove spellstormGrounded
tag @a remove spellstormPlayerLit
