data1 = import_idso1070_data('tpc_180920_2.csv', 6, 6005);
div_t = 20e-3;
div_v = 50e-3;
N  = 6000;
Fs = 10e3;

data1 = table2array(data1);
data1 = div_v * data1;

Y = fft(data1);
ymax = max(max(abs(Y)/N*2, abs(Y)/N*2));
absY = abs(Y);

plot((1:N/2)*Fs/N, absY(1:N/2)/N)
title('¿é¥Xy FFT')
% axis([0 200 -inf ymax])
xlabel('F (Hz)')
ylabel('Magnitude')