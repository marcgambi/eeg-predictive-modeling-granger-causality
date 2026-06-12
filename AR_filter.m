function x_filtered = AR_filter(X, ch, p)

a = [1 -p];
x_filtered = filter(a, 1, X(:,ch));

end
