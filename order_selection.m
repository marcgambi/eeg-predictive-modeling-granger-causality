function [p_opt_aic, p_opt_bic] = order_selection(Xdiag, pmax, p)

ret = VARorder(Xdiag,pmax);

aic_vals = ret.aic;
bic_vals = ret.bic;

[~, p_opt_aic] = min(aic_vals);
[~, p_opt_bic] = min(bic_vals);

fprintf('\nMODEL ORDER SELECTION\n');
fprintf('AIC minimum at p = %d\n', p_opt_aic);
fprintf('BIC minimum at p = %d\n', p_opt_bic);
fprintf('Selected order for final analysis = %d\n', p);

figure;
plot(aic_vals, 'b.-', 'LineWidth', 1.2);
hold on;
plot(bic_vals, 'k.-', 'LineWidth', 1.2);

plot(p_opt_aic, aic_vals(p_opt_aic), 'bo', 'MarkerSize', 10, 'LineWidth', 2);
plot(p_opt_bic, bic_vals(p_opt_bic), 'ko', 'MarkerSize', 10, 'LineWidth', 2);

xline(p, 'r--', 'Selected p', 'LineWidth', 1.5);

xlabel('Model Order');
ylabel('AIC / BIC');
legend('AIC','BIC','AIC Minimum','BIC Minimum','Selected p','Location','best');
title('Model Order Selection');
grid on;

end
