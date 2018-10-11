%% Args settings
A   = [  1,   1,   1,   1,   1,   1,   1];
F   = [100, 200, 300, 400, 500, 600, 700];
PHI = [  0,   0,   0,   0,   0,   0,   0];

Fs = 2000;
N  = 2000;

wp = 0.3*pi;
ws = 0.6*pi;
delta1 = 10e-2;
delta2 = 10e-6;

%% Data
W  = 2*pi*F;
dt = 1/Fs;
t  = [dt:dt:N*dt];
data = zeros(1,N);
for i=1:length(F)
    data = data + A(i)*sin(W(i)*t + PHI(i));
end

%% get h and y
h = typeII_filter(wp,ws,delta1,delta2);
y = data_fliter(data,h);

%% analysis
lenH = length(h)

figure(1);
stem(h,'fill');
title('LPF h[n]')

figure(2);
subplot(2,1,1);
plot(t,data);
title('x')
subplot(2,1,2);
plot(t(1:length(y)),y);
title('y')

figure(3);
subplot(2,1,1);
plot_fft(data,Fs);
title('fft(x)')
subplot(2,1,2);
plot_fft(y,Fs);
title('fft(y)')

figure(4);
freqz(h,1,length(h));


