% -------------------------------------------------------------------------
%
%Speech Communication - PROGRAMMING ASSIGNMENT II 
%
%
% ----

% which computes the k mid-frequencies of the triangular filters.
% The output of the function from E1 gives you the frequency support points that are equally distant in the
% mel domain but do not necessarily exist in the vector freqs. The function computeMids has to find the
% closest frequency support point in the linear frequency domain. Hence, you will have to compare the
% frequency support points in the vector freqs with the edges of the triangular filter in the vector edges.
% Inside your function you will first have to define the output vector mids which has the same dimensions
% as the vector edges.
% Please set the following values mids(1)=1 and mids(1,end)=edges(1,end). 



function mids = computemids( freqs,edges )

mids=zeros(1,size(edges,1));
mids(1)=1;
mids(end)=edges(end);
%mids(1,end)=edges(1,end);
mids_index= knnsearch(freqs,edges);
%for i=2:24
for i=2:25
mids(i)=freqs(mids_index(i));
end

end

