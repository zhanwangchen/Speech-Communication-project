

function Fund_Fqy = fundamentalFre(signal, max_time_lag,FS)

% get the ACF r_ss

max_simple_ponits = max_time_lag * FS;
r_ss=zeros(1,max_simple_ponits+1);

N = size(signal,1);

for tau = 0:max_simple_ponits
sum_corre = 0;  
    for k = 1+ tau : N
        sum_corre = sum_corre + signal(k) * signal(k-tau);
    end
    
    % In the ACF, ignore values for tau smaller than tau=0.002
    if (sum_corre/ N)<0.002
        r_ss(tau+1) =  0;
        %disp(1.0 * sum_corre/ N);
    end
    
    
    r_ss(tau+1) =  sum_corre / N;
end


% set the values in the ACF before the first zero crossing to
%zero.
% transform column to row 
V2 = r_ss(:);
zerosC =zeroCrossing(V2);
idR_ss = find(zerosC, 1, 'first');

if isempty(idR_ss)
    disp('empty');
else
    r_ss((1:idR_ss-1))=0;
end

%r_ss(r_ss<0.002)=0;
[ad,N] = max(r_ss); 

% find the max value of ACF and its position
[~,N] = max(r_ss); 
Fund_Fqy=nan;

% caculate the fundamental frequency
if N~=1
    T = N/FS;
    Fund_Fqy = 1/T; 
end

if Fund_Fqy>500
    %disp(Fund_Fqy);
    Fund_Fqy = nan; 
end

end

