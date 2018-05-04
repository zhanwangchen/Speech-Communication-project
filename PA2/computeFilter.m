% -------------------------------------------------------------------------
%
%
% -------------------------------------------------------------------------

% which uses the equation from above to compute the triangular filters. Plot all k triangular filters over the
% frequency into one figure and add labels to both axis. k equals the number of auditory critical bands of
% the human auditory system (24).
% (After the computation of the triangular filters the vector 𝐻𝑡
% (𝑓𝑟𝑒𝑞𝑠) contains k+2 filters. With the first
% and the last being dummy values. Delete those rows before you plot the filter.)



function H = computeFilter(mids, freqs )


HtFreqs=zeros(size(mids,2),size(freqs,1));

for t=2:size(mids,2)-1
 for j=1:size(freqs,1)
 if freqs(j)<mids(t-1)
   HtFreqs(t,j)=0;
 elseif mids(t-1)<=freqs(j)&& mids(t)>freqs(j)
   HtFreqs(t,j)=2*(freqs(j)-mids(t-1))/((mids(t+1)-mids(t-1))*(mids(t)-mids(t-1)));
 elseif mids(t)<=freqs(j)&&mids(t+1)>=freqs(j)
   HtFreqs(t,j)=2*(mids(t+1)-freqs(j))/((mids(t+1)-mids(t-1))*(mids(t+1)-mids(t)));
 elseif freqs(j)> mids(t+1)
   HtFreqs(t,j)=0;
 end
 end
end 


%With the first
% and the last being dummy values. Delete those rows before you plot the filter.)
%
 HtFreqs(1,:)=[];
 HtFreqs(end,:)=[];
 H=HtFreqs;
end

