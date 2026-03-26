execute unless entity @e[type=player] run kill @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=hStand]

# SPECIAL FX FOR SPAWNED MOBS
execute at @e[tag=wSkel] run particle minecraft:soul_fire_flame ~ ~ ~ 0 0 0 .03 10 force

# PREVENT BOTH BLAZES AND WITHERS FROM TARGETING WITHER AND THE VICE VERSA
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] as @e[type=#wither_friends,distance=..40] run team join Wither
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] as @e[type=minecraft:blaze,distance=..40] run team join Wither
# This one is for mobs in water (basically any sea creature)
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] as @e[type=#aquatic,distance=..50] run team join Wither

execute if score enraged wenraged matches 1 at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] run particle minecraft:mycelium ~ ~1 ~ 1 1 1 0 1500 normal
execute if score enraged wenraged matches 1 at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] run particle trial_omen ~ ~1 ~ 1 1 1 2 10 normal

# Resistance III when below 100 HP (uses data merge like the wArcher shield so it actually applies)
execute if entity @e[type=minecraft:wither,tag=ominousWither,limit=1,scores={Health=..100}] run data merge entity @e[type=wither,tag=ominousWither,limit=1] {active_effects:[{id:"minecraft:resistance",amplifier:2,duration:10,show_particles:0b}]}

execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run particle minecraft:ash ~ ~ ~ 10 10 10 0 300

execute if entity @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest,tag=Swarm] run function wither:wither/hit/hit6
execute if entity @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest,tag=Bedrock] run function wither:wither/hit/hit5
execute if entity @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest,tag=Dash] run function wither:wither/hit/hit4
execute if entity @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest,tag=Charge] run function wither:wither/hit/hit3
execute if entity @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest,tag=Phase1] run function wither:wither/hit/hit2
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] unless data entity @s Tags run function wither:wither/hit/hit

execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:5tick 5t
