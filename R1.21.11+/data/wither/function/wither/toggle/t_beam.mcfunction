# ON
execute if data storage wither:options {togglebeam:Disabled} as @p run schedule function wither:wither/toggle/t_beam_on 1t
execute if data storage wither:options {togglebeam:Disabled} run tellraw @s ["",{"text":"Beam Attack",bold:true,color:"#575757"},{"text":" has been ",color:"#575757"},{"text":"enabled!",color:"#13e800"}]

# OFF
execute if data storage wither:options {togglebeam:Enabled} as @p run schedule function wither:wither/toggle/t_beam_off 1t
execute if data storage wither:options {togglebeam:Enabled} run tellraw @s ["",{"text":"Beam Attack",bold:true,color:"#575757"},{"text":" has been ",color:"#575757"},{"text":"disabled!",color:"#e80f00"}]
