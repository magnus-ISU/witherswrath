# Fight tick loop - started from ominous_init, runs only while a fight is active
# Reschedule only while the ominous wither is alive; naturally stops when fight ends
execute if entity @e[type=wither,tag=ominousWither] run schedule function wither:tick 10t
execute unless entity @e[type=wither,tag=ominousWither] run function wither:wither/lifecycle/cleanup
execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Health tracking for ominous wither
execute as @e[type=wither,tag=ominousWither,limit=1] store result score @s Health run data get entity @s Health

# Health caps - prevent healing above phase thresholds
execute as @e[type=wither,tag=ominousWither,tag=!Phase1] if score @s Health matches 298.. run data modify entity @s Health set value 298.0f
execute as @e[type=wither,tag=ominousWither,tag=!Dash] if score @s Health matches 100.. run data modify entity @s Health set value 98.0f

# wArcher shield: while any wArcher is alive, continuously keep the Ominous Wither immune and glowing as other things modify effects
execute if entity @e[type=wither_skeleton,tag=wArcher] run tag @e[type=wither,tag=ominousWither] add shieldActive
execute if entity @e[type=wither_skeleton,tag=wArcher] run data merge entity @e[type=wither,tag=ominousWither,limit=1] {Health:298.0f,active_effects:[{id:"minecraft:resistance",amplifier:4,duration:-1,show_particles:0b}],Glowing:1b}

# When all wArchers are dead, kill their phantom mounts and lift the shield for one tick so that the beam can still use it.
execute unless entity @e[type=wither_skeleton,tag=wArcher] if entity @e[type=phantom,tag=wArcher] run kill @e[type=phantom,tag=wArcher]
execute unless entity @e[type=wither_skeleton,tag=wArcher] run effect clear @e[type=wither,tag=ominousWither,tag=shieldActive] resistance
execute unless entity @e[type=wither_skeleton,tag=wArcher] run data merge entity @e[type=wither,tag=ominousWither,tag=shieldActive,limit=1] {Glowing:0b}

# Trigger charge attack once when shield drops
execute if entity @e[type=wither,tag=ominousWither,tag=shieldActive] unless entity @e[type=wither_skeleton,tag=wArcher] if data storage wither:options {togglecharge:Enabled} as @e[type=wither,tag=ominousWither,limit=1] at @s run function wither:wither/phase2/charge/charge_pre
execute unless entity @e[type=wither_skeleton,tag=wArcher] run tag @e[type=wither,tag=ominousWither] remove shieldActive

# Teleport wither above player if they're 128-150 blocks away
execute at @e[type=wither,tag=ominousWither,limit=1] unless entity @a[distance=..128] as @a[distance=128..150,sort=nearest,limit=1] at @s run tp @e[type=wither,tag=ominousWither,limit=1] ~ ~30 ~
# Bring crystals along if in beam attack
execute if entity @e[type=wither,tag=ominousWither,tag=Beam] run function wither:wither/phase2/beam/beam_crystals_follow

# Aerial dive: if wither is >12 blocks above a player and within 5 blocks horizontal, slam down
execute as @e[type=wither,tag=ominousWither,tag=!Diving,tag=!Slamming,limit=1] at @s positioned ~-5 ~-300 ~-5 if entity @a[dx=10,dy=288,dz=10] run function wither:wither/dive/dive

# Force chunk load the ominous wither and wArchers
execute at @e[type=wither,tag=ominousWither,limit=1] run forceload add ~ ~
execute as @e[type=wither_skeleton,tag=wArcher] at @s run forceload add ~ ~
execute as @e[type=phantom,tag=wArcher] at @s run forceload add ~ ~

# Phase 3 (<100 HP): Wither X for players further than 16 blocks, black particle ring around wither
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run effect give @a[distance=16..150] wither 3 9 true
# Deal 2.5 wither damage every 10 ticks to players outside the zone
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] as @a[distance=16..150] at @s run damage @s 2.5 minecraft:wither by @e[type=wither,tag=ominousWither,limit=1]
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~0 ~1 ~16 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~4.14 ~1 ~15.45 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~8 ~1 ~13.86 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~11.31 ~1 ~11.31 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~13.86 ~1 ~8 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~15.45 ~1 ~4.14 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~16 ~1 ~0 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~15.45 ~1 ~-4.14 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~13.86 ~1 ~-8 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~11.31 ~1 ~-11.31 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~8 ~1 ~-13.86 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~4.14 ~1 ~-15.45 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~0 ~1 ~-16 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-4.14 ~1 ~-15.45 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-8 ~1 ~-13.86 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-11.31 ~1 ~-11.31 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-13.86 ~1 ~-8 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-15.45 ~1 ~-4.14 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-16 ~1 ~0 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-15.45 ~1 ~4.14 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-13.86 ~1 ~8 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-11.31 ~1 ~11.31 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-8 ~1 ~13.86 0 0.3 0 0 3 force
execute if entity @e[type=wither,tag=ominousWither,scores={Health=..99}] at @e[type=wither,tag=ominousWither,limit=1] run particle minecraft:squid_ink ~-4.14 ~1 ~15.45 0 0.3 0 0 3 force

# Despawn wither if no players within 150 blocks - massive explosion
execute as @e[type=wither,tag=ominousWither,limit=1] at @s unless entity @a[distance=..150] run function wither:wither/lifecycle/despawn

# Replace wither effect on summoned skeletons with regeneration II
execute as @e[tag=wSkel,nbt={active_effects:[{id:"minecraft:wither"}]}] run function wither:wither/passive/cure_wither

# Destroy nether portals in a 3x3x3 around all players within 150 blocks of the wither
execute at @e[type=wither,tag=ominousWither,limit=1] as @a[distance=..150] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace nether_portal
