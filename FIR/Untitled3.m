W_p = 0.4*pi;
W_s = 0.6*pi;
delta1 = 0.01;
delta2 = 0.001;
delta  = 0.001;

W_c = (W_s+W_p)/2;

A = -20*log10(delta);

if A > 50
    beta = 0.1102*(A-8.7);
elseif A >= 21
    bata = 0.5842*(A-21)^0.4 + 0.07886*(A-21);
else
    beta = 0;
end

M = (A-8)/(2.285*delta_w);
M = 37;

%%
alpha = M/2;
for n=0:M
    % MATLAB ±q1¶}©l
    f = sin(W_c*(n-alpha))/(pi*(n-alpha));
    w = besselj(0, beta*(1- (((n-alpha)/alpha)^2))^0.5) / besselj(0, beta);
    h(n+1) = f*w;
end
    
stem(h,'fill')
