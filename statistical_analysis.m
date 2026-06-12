function results = statistical_analysis(EEG, p, pfilter, front_idx, par_idx)

num_subjects = size(EEG.series,1);

var_oa = nan(num_subjects,1);
var_oc = nan(num_subjects,1);

gc_front_par_oa = nan(num_subjects,1);
gc_front_par_oc = nan(num_subjects,1);
gc_par_front_oa = nan(num_subjects,1);
gc_par_front_oc = nan(num_subjects,1);

for i = 1:num_subjects
    try

        X_oa = EEG.series{i,1};
        X_oc = EEG.series{i,2};

        sig_front_oa = AR_filter(X_oa, front_idx, pfilter);
        sig_front_oa = sig_front_oa - mean(sig_front_oa);

        sig_par_oa = AR_filter(X_oa, par_idx, pfilter);
        sig_par_oa = sig_par_oa - mean(sig_par_oa);

        sig_front_oc = AR_filter(X_oc, front_idx, pfilter);
        sig_front_oc = sig_front_oc - mean(sig_front_oc);

        sig_par_oc = AR_filter(X_oc, par_idx, pfilter);
        sig_par_oc = sig_par_oc - mean(sig_par_oc);

        outAR_oa = LinReg(sig_par_oa,1,1,1:p);
        outAR_oc = LinReg(sig_par_oc,1,1,1:p);

        var_oa(i) = outAR_oa.es2u;
        var_oc(i) = outAR_oc.es2u;

        Xb_oa = [sig_front_oa sig_par_oa];
        Xb_oc = [sig_front_oc sig_par_oc];

        outR_oa_P3 = LinReg(Xb_oa,2,2,1:p);
        outF_oa_P3 = LinReg(Xb_oa,2,[1 2],1:p);
        gc_front_par_oa(i) = log(outR_oa_P3.es2u / outF_oa_P3.es2u);

        outR_oa_F3 = LinReg(Xb_oa,1,1,1:p);
        outF_oa_F3 = LinReg(Xb_oa,1,[1 2],1:p);
        gc_par_front_oa(i) = log(outR_oa_F3.es2u / outF_oa_F3.es2u);

        outR_oc_P3 = LinReg(Xb_oc,2,2,1:p);
        outF_oc_P3 = LinReg(Xb_oc,2,[1 2],1:p);
        gc_front_par_oc(i) = log(outR_oc_P3.es2u / outF_oc_P3.es2u);

        outR_oc_F3 = LinReg(Xb_oc,1,1,1:p);
        outF_oc_F3 = LinReg(Xb_oc,1,[1 2],1:p);
        gc_par_front_oc(i) = log(outR_oc_F3.es2u / outF_oc_F3.es2u);

    catch
        warning("Error in subject %d", i);
    end
end

results.var_oa = var_oa;
results.var_oc = var_oc;
results.gc_front_par_oa = gc_front_par_oa;
results.gc_front_par_oc = gc_front_par_oc;
results.gc_par_front_oa = gc_par_front_oa;
results.gc_par_front_oc = gc_par_front_oc;

end
