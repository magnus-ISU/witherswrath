# Ran by advancements for summoning the Wither
advancement revoke @s only wither:wither/hit_wither


# Reveal wArchers when the Ominous Wither is hit while they're alive
execute if entity @e[type=wither,tag=ominousWither] if entity @e[type=wither_skeleton,tag=wArcher] run effect give @e[type=wither_skeleton,tag=wArcher] glowing 200 0 false
