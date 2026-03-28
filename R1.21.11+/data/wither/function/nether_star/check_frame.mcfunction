# Fired when a player interacts with an item frame
# Check if the Ominous Nether Star was placed, and if so, summon the trophy
advancement revoke @s only wither:wither/placed_star_in_frame

# Check nearby item frames and glow item frames for the Ominous Nether Star
execute as @e[type=item_frame,distance=..5] if data entity @s Item.components."minecraft:custom_data".ominous at @s run function wither:nether_star/frame_trophy
execute as @e[type=glow_item_frame,distance=..5] if data entity @s Item.components."minecraft:custom_data".ominous at @s run function wither:nether_star/frame_trophy
