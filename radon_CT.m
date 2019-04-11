

%%
close all; clear all; fclose all;
data = phantom(256);
figure,imshow(data);

S = radon(data,0:1:180);
figure, imshow(S);
xlabel('x');
ylabel('y');
grid on;
colormap(gca,jet);
colorbar;
low = min(min(S)); high = max(max(S));
caxis([low high]);


%% User defined phantom consisting of a single centered disk
close all;
P = phantom([1, 0.2, 0.4, 0, 0, 45], 501);
figure, imshow(P);
r = radon(P);
figure, imshow(r);
xlabel('x');
ylabel('y');
grid on;
colormap(gca,jet);
colorbar;
low = min(min(r)); high = max(max(r));
caxis([low high]);

%slices through the radon image
figure, plot(r(:,1),'ro-');hold on;
plot(r(:,45),'k.-'); 
plot(r(:,90),'g*-');
grid on;
