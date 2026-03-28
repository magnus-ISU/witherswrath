# Update player tracker position
function wither:wither/phase1/movement/move_player_tracker

# Dismount if Diving, or outside 22-38 range from marker
execute if entity @e[type=wither,tag=ominousWither,tag=Diving] run function wither:wither/phase1/movement/dismount
execute as @e[type=wither,tag=ominousWither,limit=1,tag=!Diving] at @e[type=marker,tag=shiftMarker,limit=1] unless entity @e[type=wither,tag=ominousWither,distance=22..38] run function wither:wither/phase1/movement/dismount

# Mount if in 29-31 sweet spot, not Diving, not on cooldown, no existing mount
execute as @e[type=wither,tag=ominousWither,limit=1,tag=!Diving,tag=!Hovering] at @e[type=marker,tag=shiftMarker,limit=1] if entity @e[type=wither,tag=ominousWither,distance=29..31] unless entity @e[type=armor_stand,tag=witherMount] run function wither:wither/phase1/movement/mount

# Push away from marker when within 30 blocks
execute as @e[type=wither,tag=ominousWither,limit=1,tag=!Diving] at @e[type=marker,tag=shiftMarker,limit=1] if entity @e[type=wither,tag=ominousWither,distance=..30] run function wither:wither/phase1/shift_away

# Reschedule every 1 tick during Phase 1
execute if entity @e[type=wither,tag=ominousWither,tag=Phase1] run schedule function wither:wither/phase1/check_player_tick 1t
