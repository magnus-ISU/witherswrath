# ONE-TIME ONLY: Removing this tag will stop the adv from triggering
tag @s remove Phase1
tag @s add Phase2
tag @s add MidpointAnimation

# Schedule beam attack 35s into Phase 2
execute if data storage wither:options {togglebeam:Enabled} run schedule function wither:wither/phase2/beam/beam_pre 35s

# Takeoff blast column
execute if data storage wither:options {toggleanimation:Default} at @s run fill ~-1 ~ ~-1 ~1 ~47 ~1 air
execute if data storage wither:options {toggleanimation:Default} at @s run summon creeper ~ ~ ~ {Team:"Wither",CustomName:"Ominous Wither's Ascent",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:6b,Fuse:1,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute if data storage wither:options {toggleanimation:Default} at @s run summon creeper ~ ~6 ~ {Team:"Wither",CustomName:"Ominous Wither's Ascent",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:7b,Fuse:3,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute if data storage wither:options {toggleanimation:Default} at @s run summon creeper ~ ~12 ~ {Team:"Wither",CustomName:"Ominous Wither's Ascent",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:8b,Fuse:5,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute if data storage wither:options {toggleanimation:Default} at @s run summon creeper ~ ~18 ~ {Team:"Wither",CustomName:"Ominous Wither's Ascent",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:9b,Fuse:7,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute if data storage wither:options {toggleanimation:Default} at @s run summon creeper ~ ~24 ~ {Team:"Wither",CustomName:"Ominous Wither's Ascent",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:10b,Fuse:9,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute if data storage wither:options {toggleanimation:Default} at @s run summon creeper ~ ~30 ~ {Team:"Wither",CustomName:"Ominous Wither's Ascent",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:11b,Fuse:11,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute if data storage wither:options {toggleanimation:Default} at @s run summon creeper ~ ~36 ~ {Team:"Wither",CustomName:"Ominous Wither's Ascent",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:12b,Fuse:13,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute if data storage wither:options {toggleanimation:Default} at @s run summon creeper ~ ~42 ~ {Team:"Wither",CustomName:"Ominous Wither's Ascent",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:13b,Fuse:15,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}

# FUNCTIONS
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/midpoint/midpoint2 2s
execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/midpoint/midpoint_tick 1t

execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/midpoint/midpoint_part_tick 4t

# BEDROCK
execute if data storage wither:options {toggleanimation:Bedrock} as @e[type=wither,tag=ominousWither,limit=1,sort=nearest] run data merge entity @e[type=wither,tag=ominousWither,limit=1,sort=nearest] {Motion:[0.0,-10.0,0.0]}
execute if data storage wither:options {toggleanimation:Bedrock} as @e[type=wither,tag=ominousWither,limit=1,sort=nearest] run schedule function wither:wither/midpoint/midpoint_bedrock 10t

# GO UP GO DOWN
execute if data storage wither:options {toggleanimation:Default} at @e[type=wither,tag=ominousWither,limit=1,sort=nearest] align xyz positioned ~.5 ~.5 ~.5 run summon armor_stand ~ ~ ~ {Team:"Wither",Invisible:1b,Tags:["midpointpos"],attributes:[{id:"minecraft:scale",base:2}]}

# BREAK BOX + SFX
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] if data storage wither:options {toggleanimation:Default} if data storage wither:options {toggledestruction:Enabled} run fill ~-1 ~ ~-1 ~1 ~3 ~1 air replace
execute as @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run playsound minecraft:entity.wither.break_block block @a[distance=..30] ~ ~ ~ 0.5 .1
execute at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] if data storage wither:options {toggleanimation:Default} run playsound minecraft:entity.wither_skeleton.hurt hostile @a[distance=..30] ~ ~ ~ 0.5 0.1

# SUMMON BLAZES
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze1 5t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze2 8t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze3 11t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze4 14t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze5 17t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze6 20t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze7 23t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze8 26t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze9 29t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches ..4 run schedule function wither:wither/midpoint/spawns/blaze10 31t

execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze1 3t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze2 5t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze3 7t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze4 8t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze5 9t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze6 10t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze7 11t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze8 13t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze9 15t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze10 16t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze11 17t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze12 19t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze13 20t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze14 21t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze15 23t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze16 25t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze17 27t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze18 28t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze19 29t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 5..9 run schedule function wither:wither/midpoint/spawns/blaze20 31t

execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze1 3t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze2 5t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze3 7t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze4 8t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze5 9t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze6 10t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze7 11t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze8 12t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze9 13t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze10 14t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze11 15t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze12 16t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze13 17t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze14 18t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze15 19t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze16 21t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze17 23t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze18 24t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze19 26t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze20 28t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze21 30t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze22 31t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze23 32t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze24 33t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze25 34t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze26 35t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze27 36t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze28 37t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze29 38t
execute if data storage wither:options {toggleanimation:Default} if score count playerCount matches 10.. run schedule function wither:wither/midpoint/spawns/blaze30 39t


execute if data storage wither:options {toggleanimation:Default} run schedule function wither:wither/midpoint/midpoint_part_tick_end 50t


# SPECIAL FX
execute if data storage wither:options {toggleanimation:Default} at @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] at @s run playsound minecraft:entity.wither.spawn hostile @a[distance=..30] ~ ~ ~ 2 .8
schedule clear wither:wither/phase1/music_phase1
execute as @a run stopsound @a record minecraft:wither.phase1
function wither:wither/phase2/music_phase2
effect give @e[type=wither_skeleton,tag=!wArcher,distance=..20] resistance 3 10
execute if data storage wither:options {toggleanimation:Default} run data merge entity @e[type=minecraft:wither,tag=ominousWither,limit=1,sort=nearest] {Invulnerable:1b,NoAI:1b,NoGravity:1b,active_effects:[{id:"minecraft:resistance",amplifier:255,duration:5}]}




