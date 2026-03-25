scoreboard players add @e[type=minecraft:wither_skull,tag=fightInitSkull] fightInitAge 1

# Constant motion (reapplied every tick so drag / bounce doesn’t build up)
execute as @e[type=minecraft:wither_skull,tag=fisH_S] run data merge entity @s {NoGravity:1b,Motion:[0.0d,0.0d,0.35d]}
execute as @e[type=minecraft:wither_skull,tag=fisH_SW] run data merge entity @s {NoGravity:1b,Motion:[-0.247d,0.0d,0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisH_W] run data merge entity @s {NoGravity:1b,Motion:[-0.35d,0.0d,0.0d]}
execute as @e[type=minecraft:wither_skull,tag=fisH_NW] run data merge entity @s {NoGravity:1b,Motion:[-0.247d,0.0d,-0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisH_N] run data merge entity @s {NoGravity:1b,Motion:[0.0d,0.0d,-0.35d]}
execute as @e[type=minecraft:wither_skull,tag=fisH_NE] run data merge entity @s {NoGravity:1b,Motion:[0.247d,0.0d,-0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisH_E] run data merge entity @s {NoGravity:1b,Motion:[0.35d,0.0d,0.0d]}
execute as @e[type=minecraft:wither_skull,tag=fisH_SE] run data merge entity @s {NoGravity:1b,Motion:[0.247d,0.0d,0.247d]}

execute as @e[type=minecraft:wither_skull,tag=fisU_S] run data merge entity @s {NoGravity:1b,Motion:[0.0d,0.08d,0.35d]}
execute as @e[type=minecraft:wither_skull,tag=fisU_SW] run data merge entity @s {NoGravity:1b,Motion:[-0.247d,0.08d,0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisU_W] run data merge entity @s {NoGravity:1b,Motion:[-0.35d,0.08d,0.0d]}
execute as @e[type=minecraft:wither_skull,tag=fisU_NW] run data merge entity @s {NoGravity:1b,Motion:[-0.247d,0.08d,-0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisU_N] run data merge entity @s {NoGravity:1b,Motion:[0.0d,0.08d,-0.35d]}
execute as @e[type=minecraft:wither_skull,tag=fisU_NE] run data merge entity @s {NoGravity:1b,Motion:[0.247d,0.08d,-0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisU_E] run data merge entity @s {NoGravity:1b,Motion:[0.35d,0.08d,0.0d]}
execute as @e[type=minecraft:wither_skull,tag=fisU_SE] run data merge entity @s {NoGravity:1b,Motion:[0.247d,0.08d,0.247d]}

execute as @e[type=minecraft:wither_skull,tag=fisD_S] run data merge entity @s {NoGravity:1b,Motion:[0.0d,-0.08d,0.35d]}
execute as @e[type=minecraft:wither_skull,tag=fisD_SW] run data merge entity @s {NoGravity:1b,Motion:[-0.247d,-0.08d,0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisD_W] run data merge entity @s {NoGravity:1b,Motion:[-0.35d,-0.08d,0.0d]}
execute as @e[type=minecraft:wither_skull,tag=fisD_NW] run data merge entity @s {NoGravity:1b,Motion:[-0.247d,-0.08d,-0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisD_N] run data merge entity @s {NoGravity:1b,Motion:[0.0d,-0.08d,-0.35d]}
execute as @e[type=minecraft:wither_skull,tag=fisD_NE] run data merge entity @s {NoGravity:1b,Motion:[0.247d,-0.08d,-0.247d]}
execute as @e[type=minecraft:wither_skull,tag=fisD_E] run data merge entity @s {NoGravity:1b,Motion:[0.35d,-0.08d,0.0d]}
execute as @e[type=minecraft:wither_skull,tag=fisD_SE] run data merge entity @s {NoGravity:1b,Motion:[0.247d,-0.08d,0.247d]}

# Block/fluid ahead (after brief spawn grace — avoids overlapping the wither’s volume)
execute as @e[type=minecraft:wither_skull,tag=fisH_S,scores={fightInitAge=3..}] at @s unless block ~ ~ ~0.35 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisH_SW,scores={fightInitAge=3..}] at @s unless block ~-0.247 ~ ~0.247 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisH_W,scores={fightInitAge=3..}] at @s unless block ~-0.35 ~ ~ minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisH_NW,scores={fightInitAge=3..}] at @s unless block ~-0.247 ~ ~-0.247 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisH_N,scores={fightInitAge=3..}] at @s unless block ~ ~ ~-0.35 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisH_NE,scores={fightInitAge=3..}] at @s unless block ~0.247 ~ ~-0.247 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisH_E,scores={fightInitAge=3..}] at @s unless block ~0.35 ~ ~ minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisH_SE,scores={fightInitAge=3..}] at @s unless block ~0.247 ~ ~0.247 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at

execute as @e[type=minecraft:wither_skull,tag=fisU_S,scores={fightInitAge=3..}] at @s unless block ~ ~0.08 ~0.34 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisU_SW,scores={fightInitAge=3..}] at @s unless block ~-0.24 ~0.09 ~0.24 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisU_W,scores={fightInitAge=3..}] at @s unless block ~-0.34 ~0.09 ~ minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisU_NW,scores={fightInitAge=3..}] at @s unless block ~-0.24 ~0.09 ~-0.24 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisU_N,scores={fightInitAge=3..}] at @s unless block ~ ~0.08 ~-0.34 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisU_NE,scores={fightInitAge=3..}] at @s unless block ~0.24 ~0.09 ~-0.24 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisU_E,scores={fightInitAge=3..}] at @s unless block ~0.34 ~0.09 ~ minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisU_SE,scores={fightInitAge=3..}] at @s unless block ~0.24 ~0.09 ~0.24 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at

execute as @e[type=minecraft:wither_skull,tag=fisD_S,scores={fightInitAge=3..}] at @s unless block ~ ~-0.08 ~0.34 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisD_SW,scores={fightInitAge=3..}] at @s unless block ~-0.24 ~-0.09 ~0.24 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisD_W,scores={fightInitAge=3..}] at @s unless block ~-0.34 ~-0.09 ~ minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisD_NW,scores={fightInitAge=3..}] at @s unless block ~-0.24 ~-0.09 ~-0.24 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisD_N,scores={fightInitAge=3..}] at @s unless block ~ ~-0.08 ~-0.34 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisD_NE,scores={fightInitAge=3..}] at @s unless block ~0.24 ~-0.09 ~-0.24 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisD_E,scores={fightInitAge=3..}] at @s unless block ~0.34 ~-0.09 ~ minecraft:air run function wither:wither/fight_start/init_skull_detonate_at
execute as @e[type=minecraft:wither_skull,tag=fisD_SE,scores={fightInitAge=3..}] at @s unless block ~0.24 ~-0.09 ~0.24 minecraft:air run function wither:wither/fight_start/init_skull_detonate_at

# Player in path (skulls won’t chain off each other at spawn — ring spacing stays > 0.42)
execute as @e[type=minecraft:wither_skull,tag=fightInitSkull,scores={fightInitAge=3..}] at @s if entity @a[distance=..0.42,gamemode=!spectator] run function wither:wither/fight_start/init_skull_detonate_at
