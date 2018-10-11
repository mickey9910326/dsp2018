
w(1) = 30;
w(2) = 90;
w(3) = 100;

A(1) = 1;
A(2) = 1;
A(3) = 1;

dt=0.01;
t = [1:dt:10+dt];
x = A(1)*sin(w(1)*t) + A(2)*sin(w(2)*t)  + A(3)*sin(w(3)*t); 
N = length(x);
Fs = 1/dt;

Y = fft(x);
ymax = max(max(abs(Y)/N*2, abs(Y)/N*2));
absY = abs(Y);

plot((1:N/2)*Fs/N, absY(1:N/2)/N)
title('¿é¥Xy FFT')
% axis([0 200 -inf ymax])
xlabel('F (Hz)')
ylabel('Magnitude')