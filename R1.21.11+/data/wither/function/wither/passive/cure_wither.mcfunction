# Regular skeletons: replace wither with regeneration II (4s)
execute if entity @s[tag=!wCaptain] run data merge entity @s {active_effects:[{id:"minecraft:regeneration",amplifier:1,duration:80,show_particles:0b}]}

# Captains: just clear wither (they already have permanent regen/strength/speed)
execute if entity @s[tag=wCaptain] run effect clear @s wither
