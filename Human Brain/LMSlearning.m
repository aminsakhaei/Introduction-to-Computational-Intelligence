clc
clear
close all

%% Inputs
x=randi([0 15],500,3);
x(:,3)=0;
n=0.001;
w=n*rand(3,3)
y=zeros(size(x));
d=zeros(size(x));
%% LMS
for i=1:500
y(i,:)=x(i,:)*w;
d(i,:)=x(i,:)-y(i,:);
e(i)=mean(d(i,:));
w=w+n*(x(i,:)')*d(i,:);
end
w_new=w
%% Result
x_out=[9,20,12]
y_out=x_out*w
x_in=[8,5,0]
y_in=x_in*w
figure(1)
plot3(x(:,1),x(:,2),x(:,3),'.m')
hold on
plot3(y(:,1),y(:,2),y(:,3),'*y')
legend({'Input','Output'})
figure(2)
plot3(x_out(:,1),x_out(:,2),x_out(:,3),'.k')
hold on
plot3(y_out(:,1),y_out(:,2),y_out(:,3),'*c')
hold on
plot3(x(:,1),x(:,2),x(:,3),'.m')
hold on
plot3(y(:,1),y(:,2),y(:,3),'*y')
legend({'Input test','Output test','Input','Output'})
figure(3)
plot3(x_in(:,1),x_in(:,2),x_in(:,3),'.k')
hold on
plot3(y_in(:,1),y_in(:,2),y_in(:,3),'*c')
hold on
plot3(x(:,1),x(:,2),x(:,3),'.m')
hold on
plot3(y(:,1),y(:,2),y(:,3),'*y')
legend({'Input test','Output test','Input','Output'})
figure(4)
plot(e)
title('Mean squared error')
