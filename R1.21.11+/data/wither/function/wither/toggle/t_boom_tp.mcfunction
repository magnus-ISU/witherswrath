# ON
execute if data storage wither:options {toggleboomtp:Disabled} as @p run schedule function wither:wither/toggle/t_boom_tp_on 1t
execute if data storage wither:options {toggleboomtp:Disabled} run tellraw @s ["",{"text":"First Phase Explosions",bold:true,color:"#575757"},{"text":" have been ",color:"#575757"},{"text":"enabled!",color:"#13e800"}]

# OFF
execute if data storage wither:options {toggleboomtp:Enabled} as @p run schedule function wither:wither/toggle/t_boom_tp_off 1t
execute if data storage wither:options {toggleboomtp:Enabled} run tellraw @s ["",{"text":"First Phase Explosions",bold:true,color:"#575757"},{"text":" have been ",color:"#575757"},{"text":"disabled!",color:"#e80f00"}]
