function plots(results)

figure;

boxplot([results.var_oa results.var_oc], ...
    'Labels', {'Eyes Open','Eyes Closed'});

title('Residual Variance');
ylabel('Variance');
grid on;

figure;

subplot(1,2,1);

boxplot([results.gc_front_par_oa results.gc_front_par_oc], ...
    'Labels', {'Eyes Open','Eyes Closed'});

title('Granger Causality F3 → P3');
ylabel('GC');
grid on;

subplot(1,2,2);

boxplot([results.gc_par_front_oa results.gc_par_front_oc], ...
    'Labels', {'Eyes Open','Eyes Closed'});

title('Granger Causality P3 → F3');
ylabel('GC');
grid on;

end
