clear 
%--------set5 prob4--------%

xmax=100;
xmin=-100;   
dx=0.1;

ymax=100;   
ymin=-100;   
dy=0.1;

zmax=100;   
zmin=-100;   
dz=0.1;

a=1; %free parameter

Sum=0;
for x=xmin:dx:xmax
    for y=ymin:dy:ymax
        for z=zmin:dz:zmax
            Sum = Sum + (z.^2)*exp(-a*(x.^2+y.^2+z.^2))*dx*dy*dz;
        end
    end
end

disp(['Result of integrate is : ' Sum])

