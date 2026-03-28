team remove Wither
scoreboard players set wCharge wcharge1 1
scoreboard players set wspawn spawn 0
scoreboard players set wChargereset wchargereset 0
scoreboard players set enraged wenraged 0
schedule clear wither:wither/dive/dive_tick
schedule clear wither:wither/dive/divecooldown
schedule clear wither:wither/dive/land

# Clear all fight schedules
schedule clear wither:wither/phase2/charge/charge
schedule clear wither:wither/phase2/charge/charge2
schedule clear wither:wither/phase2/charge/charge_pre
schedule clear wither:wither/phase2/charge/charge_tick
schedule clear wither:wither/phase2/charge/charge_reset
schedule clear wither:wither/phase2/dashes/dash
schedule clear wither:wither/phase2/dashes/dash_to
schedule clear wither:wither/phase2/dashes/end_loop
schedule clear wither:wither/phase1/homing/homing
schedule clear wither:wither/phase1/homing/homing_pre
schedule clear wither:wither/phase1/homing/homing_tick
schedule clear wither:wither/phase1/homing/homing_5tick
schedule clear wither:wither/phase1/music_phase1
schedule clear wither:wither/phase1/check_player_tick
schedule clear wither:wither/phase2/music_phase2
schedule clear wither:wither/phase2/enraged/skulls/kill_skulls
schedule clear wither:wither/phase2/enraged/skulls/skulls
schedule clear wither:wither/phase2/enraged/skulls/stop_skulls
schedule clear wither:wither/phase2/enraged/skulls/rotation
schedule clear wither:wither/skull/launch
schedule clear wither:wither/skull/launch_end
schedule clear wither:wither/skull/burst/launch_burst_loop
schedule clear wither:wither/skull/burst/launch_burst_loop_reset
schedule clear wither:wither/passive/spawn
schedule clear wither:wither/passive/spawn_captain
schedule clear wither:wither/passive/skull
schedule clear wither:wither/phase2/beam/beam_pre
schedule clear wither:wither/phase2/beam/beam_ascend
schedule clear wither:wither/phase2/beam/beam_aim_tick
schedule clear wither:wither/phase2/beam/beam_fire_left
schedule clear wither:wither/phase2/beam/beam_fire_center
schedule clear wither:wither/phase2/beam/beam_fire_right
schedule clear wither:wither/phase2/beam/beam_end
schedule clear wither:wither/fight_start/part
schedule clear wither:wither/fight_start/init_ring_explode
schedule clear wither:wither/unstuck/check
schedule clear wither:wither/lifecycle/timeout
schedule clear wither:wither/phase1/hover_cooldown
schedule clear wither:wither/phase1/movement/spawn_player_tracker

    schedule function wither:xp/xp 1t

# MUSIC
    execute as @a run stopsound @a record minecraft:wither.phase2
    execute at @e[type=item_display,tag=nether_star,limit=1] run playsound minecraft:wither.death hostile @a ~ ~ ~ 1 1
    execute at @e[type=item_display,tag=nether_star,limit=1] run playsound minecraft:ui.toast.challenge_complete player @a ~ ~ ~ 1 0.9
    execute at @e[type=item_display,tag=nether_star,limit=1] run playsound minecraft:music.creative music @a
    execute at @e[type=item_display,tag=nether_star,limit=1] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 100 .85

# PEACE
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=wither_skeleton,distance=..100]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[tag=wSkel]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[tag=wither_dash]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[tag=wArcher]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=zombie,distance=..80]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=creeper,distance=..80]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=armor_stand,tag=hStand,distance=..100]
    execute at @e[type=item_display,tag=nether_star,limit=1] run kill @e[type=armor_stand,tag=chargew,distance=..100]
    kill @e[type=marker,tag=wSpawnMarker]
    function wither:wither/phase1/movement/dismount
    kill @e[type=marker,tag=shiftMarker]
    kill @e[tag=beamCrystalL]
    kill @e[tag=beamCrystalC]
    kill @e[tag=beamCrystalR]
    kill @e[tag=beamTargetLeft]
    kill @e[tag=beamTargetRight]
    kill @e[tag=beamTargetCenter]
    tag @a remove beamTarget1
    tag @a remove beamTarget2
    tag @a remove beamTarget3

# Remove force-loaded chunks
forceload remove all
