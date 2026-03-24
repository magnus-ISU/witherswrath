# Ran by advancements for attacking the Wither
advancement revoke @s only wither:wither/hit6_wither


execute as @e[type=wither,tag=theWither,scores={Health=..150}] if data storage wither:options {toggleanimation:Default} at @s run function wither:wither/phase2/swarm
