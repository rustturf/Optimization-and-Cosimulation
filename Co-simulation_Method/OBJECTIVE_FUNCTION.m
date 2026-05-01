function Px=OBJECTIVE_FUNCTION(input)
Variable_Voltage=input(1);
Aplha=input(2);
assignin('base','Variable_Voltage',Variable_Voltage);
assignin('base','Alpha',Aplha);
Cosimulation_Code;
Px=P_x;
end
