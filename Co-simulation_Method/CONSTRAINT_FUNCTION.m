function[c1,c2]=CONSTRAINT_FUNCTION(input)
Variable_Voltage=input(1);
Alpha=input(2);
c1=-0.5*Variable_Voltage-5*Alpha+10;
c2=[];

end
