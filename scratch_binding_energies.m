

Z =1;
for Z = 1:120
    for ii = 1:7
        e(Z,ii) = -13.6 *Z^2/ii^2;
    end

    
end

%%
close all
    figure, plot((-1)*e(1:120,6)/1000.0,'ro-');
    grid on;
    title('K SHELLS');
    %matches plots of K shells for first 80 elements 
    
    
    
    %%
    h = 6.62607004e-34; %#10-34 #m2 kg / s
    c = 3e8; %#speed of light m/s

    me = 9.10938356e-31;% #×10−31 #mass of electron
    joules2ev = 6.242e+18;
    
    
    for hv0 = 1:150
        tcounter = 0;
       for theta = -180:180
           tcounter = tcounter + 1;
           hvcs(hv0,tcounter) = hv0/(1 + (hv0/((me*c^2)*joules2ev)) * (1-cos(theta)));
       end
        
    end
    
    
