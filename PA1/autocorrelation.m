

function r_ss = autocorrelation(signal, max_time_lag)

FS = 16000;

max_simple_ponits = max_time_lag * FS;

%initialize the ACF vector
r_ss=zeros(1,max_simple_ponits+1);
N = size(signal,1);


%calculate the ACF according to the formular given in homework sheet
for tau = 0:max_simple_ponits
sum_corre = 0;  
    for k = 1+ tau : N
        sum_corre = sum_corre + signal(k) * signal(k-tau);
    end
    r_ss(tau+1) =  sum_corre / N;
end
        
end

