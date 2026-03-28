# Motion-based wither escape system
# Makes the wither move away from the shift marker (sticky player position)

# Don't push if mounted (locked in place)
execute if entity @e[type=armor_stand,tag=witherMount] run return 0

# Store wither position
execute as @e[type=minecraft:wither,sort=nearest,limit=1] at @s store result score @s wither.temp.x run data get entity @s Pos[0] 1000
execute as @e[type=minecraft:wither,sort=nearest,limit=1] at @s store result score @s wither.temp.y run data get entity @s Pos[1] 1000
execute as @e[type=minecraft:wither,sort=nearest,limit=1] at @s store result score @s wither.temp.z run data get entity @s Pos[2] 1000

# Store marker position
execute as @e[type=marker,tag=shiftMarker,limit=1] store result score @s wither.temp.px run data get entity @s Pos[0] 1000
execute as @e[type=marker,tag=shiftMarker,limit=1] store result score @s wither.temp.py run data get entity @s Pos[1] 1000
execute as @e[type=marker,tag=shiftMarker,limit=1] store result score @s wither.temp.pz run data get entity @s Pos[2] 1000

# Calculate direction vector (wither - marker = away from marker)
execute as @e[type=minecraft:wither,sort=nearest,limit=1] run scoreboard players operation @s wither.temp.x -= @e[type=marker,tag=shiftMarker,limit=1] wither.temp.px
execute as @e[type=minecraft:wither,sort=nearest,limit=1] run scoreboard players operation @s wither.temp.y -= @e[type=marker,tag=shiftMarker,limit=1] wither.temp.py
execute as @e[type=minecraft:wither,sort=nearest,limit=1] run scoreboard players operation @s wither.temp.z -= @e[type=marker,tag=shiftMarker,limit=1] wither.temp.pz

# Apply motion to the wither
execute as @e[type=minecraft:wither,sort=nearest,limit=1] store result entity @s Motion[0] double 0.00015 run scoreboard players get @s wither.temp.x
execute as @e[type=minecraft:wither,sort=nearest,limit=1] store result entity @s Motion[1] double 0.00005 run scoreboard players get @s wither.temp.y
execute as @e[type=minecraft:wither,sort=nearest,limit=1] store result entity @s Motion[2] double 0.00015 run scoreboard players get @s wither.temp.z

# Add additional upward motion boost to help escape
execute as @e[type=minecraft:wither,sort=nearest,limit=1] run data modify entity @s Motion[1] set value 0.6d

# Make the wither face the nearest player while moving
execute as @e[type=minecraft:wither,sort=nearest,limit=1] at @s rotated as @s run tp @e[type=minecraft:wither,sort=nearest,limit=1] ~ ~ ~ facing entity @p eyes
