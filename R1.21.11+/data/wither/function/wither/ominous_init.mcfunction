# Initialize ominous wither fight
# Called when a wither is summoned by a player with Bad Omen and no other ominous wither exists

# Tag and set invulnerability
tag @s add ominousWither
tag @s add Invul
data merge entity @s {Invul:220,CustomName:'Ominous Wither'}
data modify entity @s attributes append value {id:"minecraft:scale",base:1.5}

# Remove bad omen from nearby players so they don't trigger a raid
effect clear @a[distance=..100] minecraft:bad_omen

# Check gamerules and player count
execute store result score cmdFbk rules run gamerule send_command_feedback
execute store result score count playerCount run execute if entity @e[type=player,distance=..100]

# Schedule all fight functions
schedule function wither:wither_check 1t
schedule function wither:wither/fight_start/init 1t
schedule function wither:tick 1t
schedule function wither:5_tick 2t
schedule function wither:wither/skull/launch 22s
schedule function wither:wither/skull/burst/launch_burst_loop 30s
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/passive/skull 12s
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/motion/gravity 10s
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/phase1/movement/spawn_player_tracker 239t
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/phase1/check_player_tick 12s
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/fight_start/part 1t
execute if data storage wither:options {togglehoming:Enabled} run schedule function wither:wither/phase1/homing/homing_pre 10s
execute if data storage wither:options {togglespawns:Enabled} run schedule function wither:wither/passive/spawn 15s
schedule function wither:wither/lifecycle/spawn 219t
schedule function wither:wither/unstuck/check 15s
schedule function wither:wither/lifecycle/timeout 24000t
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/fight_start/tick 1t
execute if data storage wither:options {toggleanimation:Bedrock} run schedule function wither:wither/fight_start/bedrock 1t
