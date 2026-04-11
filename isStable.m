function stable = isStable(x_hist)
delta_hist = x_hist(1:3,:);

delta12 = delta_hist(1,:) - delta_hist(2,:);
delta13 = delta_hist(1,:) - delta_hist(3,:);
delta23 = delta_hist(2,:) - delta_hist(3,:);

max_sep = max([max(abs(delta12)), max(abs(delta13)), max(abs(delta23))]);

stable = max_sep < pi;     % or try 2*pi if needed
end