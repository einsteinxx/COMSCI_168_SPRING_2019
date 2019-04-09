

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