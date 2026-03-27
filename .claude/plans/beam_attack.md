I'd like to add a new attack, which is a beam attack.

Grok made the following implementation plan with me:

1. The wither flies up with levitation after receiving NoAI. It goes up 30 blocks, or to the ceiling and then down 5 blocks.
2. The wither summons 3 invisible ender crystals in its heads.
3. The center head chooses a random player within 150 blocks to target.
4. The side heads choose the same random player within 150 blocks, which could be the same target as the main head.
5. The crystals each have a defined animation where the crystal target circles around the target player 120 blocks up for 60 ticks, the target goes down by 0.5 block every tick for 100 ticks, down 1 block every tick for 30 ticks, and then 2 blocks every tick for 20 ticks. Then they stay locked on the target player for 50 ticks. Total: 13 seconds
6. A raycast is sent out from the wither to the targeted player. Every 3 blocks, an invisible charged creeper is spawned along the raycast, until it runs into a block. The raycasts are all done at the same time, but the explosions are staggered; the first side head fires, 5 ticks later the main head fires, 5 ticks later the second side head fires.
7. The wither is given AI and other attacks are allowed to start processing.

Grok provided some (wrong) sample code.

>>>

Here is a complete, ready-to-use set of mcfunction files for your exact Wither laser attack.
The attack works like this:

The Wither must have the tag boss.wither.
When the phase starts, the Wither is teleported to 0 100 0 (as you requested) and hovers there.
A hidden aim marker is created high above the nearest player (initially ~80 blocks above them → beam points almost straight up).
Over the first ~4 seconds the marker’s Y lowers by 1 block per tick while still tracking the player’s X/Z (slow angle-down).
In the last 1 second (20 ticks) the beam locks onto the player.
Every tick during the phase a raycast fires from the Wither (anchored at eye level) toward the aim marker.
The raycast spawns a bright guardian-style beam (end_rod + dust_color_transition) that stops at the first solid block.
Along the ray (every ~2 blocks to keep performance sane) it summons an instant-exploding creeper with default power 3 (≈ radius 6 blocks destruction/damage). You can change the step if you want denser/sparser explosions.

Create the files exactly as shown inside your datapack (data/boss/functions/...).
1. data/boss/functions/load.mcfunction
mcfunctionscoreboard objectives add boss.laser dummy "Wither Laser Timer"
scoreboard objectives add boss.temp dummy
tellraw @a {"text":"[Boss Datapack] Loaded laser attack","color":"gold"}
2. data/boss/functions/tick.mcfunction (run every tick – add this to your main tick loop)
mcfunction# Run laser phase if active
execute as @e[tag=boss.wither] if score @s boss.laser matches 1.. run function boss:laser/tick

# Optional: auto-start example every 30 seconds (remove or change as needed)
execute as @e[tag=boss.wither] unless score @s boss.laser matches 1.. if predicate {condition:random_chance,chance:0.033} run function boss:laser/start
3. data/boss/functions/laser/start.mcfunction
mcfunction# Teleport Wither to your fixed high location and start the phase
execute as @e[tag=boss.wither,limit=1] run tp @s 0 100 0

# Reset and start timer (100 ticks = 5 seconds)
scoreboard players set @e[tag=boss.wither,limit=1] boss.laser 100

# Summon (or reset) the hidden aim marker
kill @e[tag=boss.laser_aim]
summon marker 0 100 0 {Tags:["boss.laser_aim"]}

# Set initial aim point: directly above the nearest player
execute as @e[tag=boss.laser_aim,limit=1] at @s run tp @s @p[gamemode=!spectator]
execute as @e[tag=boss.laser_aim,limit=1] at @s run tp @s ~ ~80 ~

# Optional: fly the Wither up a bit more and play charge sound
execute as @e[tag=boss.wither] at @s run playsound entity.wither.ambient hostile @a ~ ~ ~ 10 0.8
particle end_rod ~ ~ ~ 0 5 0 0 50 force

tellraw @a {"text":"Wither laser phase started!","color":"red"}
4. data/boss/functions/laser/tick.mcfunction
mcfunction# Decrease timer
scoreboard players remove @e[tag=boss.wither,limit=1] boss.laser 1

# Update aim marker (the "slowly angle down" part)
execute as @e[tag=boss.laser_aim,limit=1] at @s run function boss:laser/update_aim

# Fire the raycast from the Wither toward the current aim point
execute as @e[tag=boss.wither,limit=1] at @s anchored eyes facing entity @e[tag=boss.laser_aim,limit=1] eyes run function boss:laser/raycast_start

# End phase when timer reaches 0
execute as @e[tag=boss.wither] if score @s boss.laser matches ..0 run function boss:laser/end
5. data/boss/functions/laser/update_aim.mcfunction
mcfunction# Copy player's current X and Z (keeps horizontal tracking)
summon marker ~ ~ ~ {Tags:["boss.temp_player"]}
execute as @e[tag=boss.temp_player,limit=1] run tp @s @p[gamemode=!spectator]
data modify entity @e[tag=boss.laser_aim,limit=1] Pos[0] set from entity @e[tag=boss.temp_player,limit=1] Pos[0]
data modify entity @e[tag=boss.laser_aim,limit=1] Pos[2] set from entity @e[tag=boss.temp_player,limit=1] Pos[2]
kill @e[tag=boss.temp_player]

# === ANGLE DOWN PHASE ===
execute as @e[tag=boss.wither] if score @s boss.laser matches 21.. run tp @e[tag=boss.laser_aim,limit=1] ~ ~ -1 ~

# === LOCK ON PHASE (last 1 second) ===
execute as @e[tag=boss.wither] if score @s boss.laser matches ..20 run tp @e[tag=boss.laser_aim,limit=1] @p[gamemode=!spectator]
6. data/boss/functions/laser/raycast_start.mcfunction
mcfunction# Reset step counter for creeper spacing
scoreboard players set #laser_steps boss.temp 0

# Start the recursive raycast
function boss:laser/raycast_step
7. data/boss/functions/laser/raycast_step.mcfunction
mcfunction# STOP if we hit a solid block
execute unless block ~ ~ ~ #minecraft:replaceable run return 0

# === VISUAL BEAM (guardian / end-rod style) ===
particle end_rod ~ ~ ~ 0 0 0 0 3 force
particle dust_color_transition 0.2 0.5 1.0 1.8 0.9 0.95 1.0 ~ ~ ~ 0.2 0.2 0.2 0 12 force

# === EXPLOSION every ~2 blocks (prevents lag) ===
scoreboard players add #laser_steps boss.temp 1
execute if score #laser_steps boss.temp matches 4.. run function boss:laser/summon_creeper
execute if score #laser_steps boss.temp matches 4.. run scoreboard players set #laser_steps boss.temp 0

# === DAMAGE players in the beam ===
execute as @a[distance=..1.5,gamemode=!spectator] run damage @s 12 minecraft:magic by @e[tag=boss.wither,limit=1]

# Move forward and recurse (0.5 block steps = smooth beam)
execute positioned ^ ^ ^0.5 run function boss:laser/raycast_step

# Safety limit (max ~200 blocks)
scoreboard players add #laser_steps boss.temp 1
execute if score #laser_steps boss.temp matches 400.. run return 0
8. data/boss/functions/laser/summon_creeper.mcfunction
mcfunction# Instant exploding creeper (≈ radius 6 blocks)
summon creeper ~ ~ ~ {NoAI:1b,Silent:1b,Fuse:0s,Invulnerable:1b,Tags:["laser_explode"]}
9. data/boss/functions/laser/end.mcfunction
mcfunctionkill @e[tag=boss.laser_aim]
scoreboard players reset @e[tag=boss.wither] boss.laser
tellraw @a {"text":"Wither laser phase ended","color":"gray"}
How to use

Put all files in data/boss/functions/ (create the folders if needed).
Run /function boss:load once.
Make sure your main datapack tick function calls function boss:tick every tick.
Summon your Wither with the tag:
/summon wither ~ ~ ~ {Tags:["boss.wither"],NoAI:0b}
(or add the tag to your existing boss).

You can tweak:

Timer length (change the 100 in start.mcfunction)
Creeper density (change the 4 in raycast_step)
Beam colors / particles
Add charge-up sounds or Wither flying motion in the start function if you want extra flair.

This gives you exactly the cinematic “starts pointing straight up above the player → slowly angles down → locks on → exploding beam that stops at blocks” mechanic you described. Let me know if you want the end-crystal beam layered on top or any other tweaks!

>>>
