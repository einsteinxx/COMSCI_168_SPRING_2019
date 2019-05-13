b = zeros(I,J);
[x,y]=meshgrid([1:J] -J/2,[1:I] - I/2);

for phi = 0:179
    s = x * cos(pi/180*phi) + y * sin(pi/180*phi);
    %b = b + interp1(sn,g(:,phi+1),2);
end

%%

N=ceil(sqrt(I*I+J*J))+1;
N0= floor((N-1)/2);
ql=1;
G=zeros(N,180);
for phi=0:179
    for x=-J/2:J/2-1
        for y = -I/2:I/2-1
            l=x*cos(phi*pi/180)+y*sin(phi*pi/180);
            l=round(l/ql)+N0+1;
            if (l>=1) && (l<=N)
                G(l,phi+1)=G(l,phi+1)+f(x+J/2+1,y+I/2+1);
            end
        end
    end
end