function out = LinReg(data, jv, iv, iv_lags)

if isvector(data)
    data = data(:);
end

N = size(data,1);
maxlag = max(iv_lags);

My = data(maxlag+1:end,jv);
MX = [];

for l = 1:length(iv_lags)
    for k = 1:length(iv)
        MX = [MX data(maxlag+1-iv_lags(l):end-iv_lags(l), iv(k))];
    end
end

A = (MX'*MX)\(MX'*My);

eu = My - MX*A;

es2u = cov(eu);
es2y = cov(My);

erho2 = 1 - det(es2u)/det(es2y);

out.eA = A;
out.eu = eu;
out.es2u = es2u;
out.es2y = es2y;
out.erho2 = erho2;

end
