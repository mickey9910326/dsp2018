function [y] = data_fliter(x,h)
len_x = length(x);
len_h = length(h);
for i=1:len_x-len_h
    y(i) = dot(x(i:i+len_h-1), h);
% y = conv(h,x);
end

