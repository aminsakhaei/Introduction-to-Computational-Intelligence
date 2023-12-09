clc
clear
close all

%% Inputs
x=[0 0 1;0 1 1;1 0 1;1 1 1];
d=[0 0 0;0 1 1;0 1 1;1 1 0];
n=0.001;
w=n*rand(3,3)
y=zeros(size(x));

%% Training
for i=1:30
y = x * w;
    for j=1:12
        if (y(j)>=0)
            y(j)=1;
        else
            y(j)=0;
        end
    end
y_e = d - y;
e(i,1)=mean(abs(y_e(:,1)));
e(i,2)=mean(abs(y_e(:,2)));
e(i,3)=mean(abs(y_e(:,3)));
w= w + n*(x')*y_e;
end
w_new=w

%% Result
figure(1)
plot(e(:,1))
title('Mean squared error "AND"')
figure(2)
plot(e(:,2))
title('Mean squared error "OR"')
figure(3)
plot(e(:,3))
title('Mean squared error "XOR"')
