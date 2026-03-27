# Beam Attack Entry Point - Phase 2 (300-100 HP)
# Check toggle
execute unless data storage wither:options {togglebeam:Enabled} run return 0
execute unless entity @e[type=wither,tag=ominousWither] run return 0

# Don't fire beam if already beaming
execute if entity @e[type=wither,tag=ominousWither,tag=Beam] run return 0
# Don't fire beam if actively charging (but shield-up Charge tag is fine)
execute if entity @e[type=wither,tag=ominousWither,tag=Charge,tag=!shieldActive] run return 0
# Don't fire below 100 HP
execute unless entity @e[type=wither,tag=ominousWither,scores={Health=100..}] run return 0

# Setup
tag @e[type=wither,tag=ominousWither,limit=1] add Beam
data merge entity @e[type=wither,tag=ominousWither,limit=1] {NoAI:1b,Glowing:1b,active_effects:[{id:"minecraft:resistance",amplifier:255,duration:300,show_particles:0b}]}

# Creeper column to clear ascent path (like midpoint.mcfunction)
execute at @e[type=wither,tag=ominousWither,limit=1] run summon creeper ~ ~ ~   {Team:"Wither",CustomName:"Ominous Wither's Beam",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:4b,Fuse:1,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute at @e[type=wither,tag=ominousWither,limit=1] run summon creeper ~ ~5 ~   {Team:"Wither",CustomName:"Ominous Wither's Beam",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:4b,Fuse:3,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute at @e[type=wither,tag=ominousWither,limit=1] run summon creeper ~ ~10 ~  {Team:"Wither",CustomName:"Ominous Wither's Beam",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:4b,Fuse:5,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute at @e[type=wither,tag=ominousWither,limit=1] run summon creeper ~ ~15 ~  {Team:"Wither",CustomName:"Ominous Wither's Beam",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:4b,Fuse:7,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute at @e[type=wither,tag=ominousWither,limit=1] run summon creeper ~ ~20 ~  {Team:"Wither",CustomName:"Ominous Wither's Beam",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:4b,Fuse:9,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute at @e[type=wither,tag=ominousWither,limit=1] run summon creeper ~ ~25 ~  {Team:"Wither",CustomName:"Ominous Wither's Beam",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:4b,Fuse:11,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}
execute at @e[type=wither,tag=ominousWither,limit=1] run summon creeper ~ ~30 ~  {Team:"Wither",CustomName:"Ominous Wither's Beam",Silent:1b,Invulnerable:1b,NoAI:1b,ExplosionRadius:4b,Fuse:13,ignited:1b,active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b,show_icon:0b}]}

# Sound
execute at @e[type=wither,tag=ominousWither,limit=1] run playsound minecraft:entity.wither.spawn hostile @a[distance=..150] ~ ~ ~ 2 0.5

# Start ascent
scoreboard players set ominousWither beamTimer 0
schedule function wither:wither/phase2/beam/beam_ascend 1t
