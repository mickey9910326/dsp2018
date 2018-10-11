%% Args settings
A   = [1, 1, 1];
F   = [50, 250, 500];
PHI = [0, 0, 0];

Fs = 2000;
N  = 2000;

%% Data
W  = 2*pi*F;
dt = 1/Fs;
t  = [dt:dt:N*dt];
data = zeros(1,N);
for i=1:length(F)
    data = data + A(i)*sin(W(i)*t + PHI(i));
end

%% 