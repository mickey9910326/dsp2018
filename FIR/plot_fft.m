function [Y] = plot_fft(x,Fs)
Y = fft(x);
n = length(x);

f = Fs*(0:(n/2))/n;
P = abs(Y/n);

plot(f,P(1:n/2+1)) 
title('Gaussian Pulse in Frequency Domain')
xlabel('Frequency (f)')
ylabel('|P(f)|')
end

