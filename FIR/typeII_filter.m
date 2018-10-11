function [h] = typeII_filter(wp,ws,delta1,delta2)
% maybe can use https://wenku.baidu.com/view/4bd946f77c1cfad6195fa736.html
% this function is use kaiser method

delta = min([delta1 delta2]);

W_c = (ws+wp)/2;
W_delta = ws-wp;

A = -20*log10(delta);

if A > 50
    beta = 0.1102*(A-8.7);
elseif A >= 21
    beta = 0.5842*(A-21)^0.4 + 0.07886*(A-21);
else
    beta = 0;
end

M = (A-8)/(2.285*W_delta);
% M = (A/22)*(2*pi/W_delta); another method ?
% get min odd 
% type II design
M = floor(M)+1-mod(floor(M),2);

% minEven = int_a+mod(int_a,2); %最近偶?

%%
alpha = M/2;
h = zeros(1,M);
for n=0:M
    % MATLAB 從1開始
    f = sin(W_c*(n-alpha))/(pi*(n-alpha));
    w = besselj(0, beta*(1- (((n-alpha)/alpha)^2))^0.5) / besselj(0, beta);
    h(n+1) = f*w;
end

end

