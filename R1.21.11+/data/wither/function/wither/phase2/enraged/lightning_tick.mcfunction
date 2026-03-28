# Strike lightning at the wither - 10 times over 2 seconds (every 4 ticks)
execute as @e[type=wither,tag=ominousWither,limit=1] at @s run summon minecraft:lightning_bolt ~ ~ ~
scoreboard players add #lightning stages 1

# Continue lightning if under 10 strikes
execute unless score #lightning stages matches 10.. run schedule function wither:wither/phase2/enraged/lightning_tick 4t

# At 10 strikes, initiate the ground slam dive
execute if score #lightning stages matches 10.. run function wither:wither/dive/ground_slam
execute if score #lightning stages matches 10.. run scoreboard players set #lightning stages 0
