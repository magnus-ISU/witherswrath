# Ran by advancements for attacking the Wither
advancement revoke @s only wither:wither/hit_wither

# Reveal wArchers when the Ominous Wither is hit while they're alive (30 seconds)
execute if entity @e[type=wither,tag=ominousWither] if entity @e[type=wither_skeleton,tag=wArcher] run effect give @e[type=wither_skeleton,tag=wArcher] glowing 30 0 false
