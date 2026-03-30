# Run as explosion anchor armor stand at its position (fourth tick of blast sequence)
execute as @a[distance=..21,tag=ClearResistance] run effect clear @s minecraft:resistance
tag @a[distance=..21,tag=ClearResistance] remove ClearResistance
