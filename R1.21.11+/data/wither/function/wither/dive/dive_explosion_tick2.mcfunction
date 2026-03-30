execute at @e[type=armor_stand,tag=DiveExplosionAnchor,limit=1,sort=arbitrary] run effect give @a[distance=..17] minecraft:resistance 1 4 true
execute at @e[type=armor_stand,tag=DiveExplosionAnchor,limit=1,sort=arbitrary] run function wither:wither/dive/dive_explosion_barrage
