# ON
execute if data storage wither:options {togglecharge:Disabled} as @p run schedule function wither:wither/toggle/t_charge_on 1t
execute if data storage wither:options {togglecharge:Disabled} run tellraw @s ["",{"text":"Charge Attack",bold:true,color:"#575757"},{"text":" has been ",color:"#575757"},{"text":"enabled!",color:"#13e800"}]

# OFF
execute if data storage wither:options {togglecharge:Enabled} as @p run schedule function wither:wither/toggle/t_charge_off 1t
execute if data storage wither:options {togglecharge:Enabled} run tellraw @s ["",{"text":"Charge Attack",bold:true,color:"#575757"},{"text":" has been ",color:"#575757"},{"text":"disabled!",color:"#e80f00"}]
