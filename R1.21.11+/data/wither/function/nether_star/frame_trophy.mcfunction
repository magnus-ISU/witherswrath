# Summon the floating Ominous Nether Star display at the item frame, then destroy the frame
# @s is the item frame

# Summon display entity (vehicle)
summon item_display ~ ~ ~ {NoGravity:1b,Tags:["nether_star","ns_new_display","ns_rising"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.8f,0f],scale:[1.5f,1.5f,1.5f]},item:{id:"minecraft:nether_star",count:1}}

# Summon the Ominous Nether Star item as passenger
summon item ~ ~ ~ {Age:-32768,PickupDelay:100,Invulnerable:1b,NoGravity:1b,Tags:["OminousNetherStar","ns_new"],Item:{id:"minecraft:nether_star",count:1,components:{"minecraft:custom_data":{ominous:1b},"minecraft:max_stack_size":1,"minecraft:custom_name":{text:"Ominous Nether Star",bold:true,color:"dark_purple"},"minecraft:lore":[[{text:"A peerless star, pulled from the",color:"gray",italic:false}],[{text:"slumbering voids beneath Hell.",color:"gray",italic:false}]],"minecraft:rarity":"epic","minecraft:enchantment_glint_override":true}}}
ride @e[type=item,tag=ns_new,limit=1] mount @e[type=item_display,tag=ns_new_display,limit=1]
tag @e[tag=ns_new_display] remove ns_new_display
tag @e[tag=ns_new] remove ns_new

# Effects
playsound minecraft:particle.soul_escape master @a[distance=..30] ~ ~ ~ 30 0.5 1
particle minecraft:soul ~ ~ ~ 0.2 0.2 0.2 0.03 15 normal

# Kill the item frame
kill @s

# Start tick loop and smooth 1-tick rise loop
function wither:nether_star/tick
function wither:nether_star/rise
schedule function wither:nether_star/stop_rising 80t
