% -------------------------------------------------------------------------
% ---------------------------------

% Use the following equation to compute the mel-value of a linear frequency:
% 𝑀𝑒𝑙(𝑓) = 2595 ∙ 𝑙𝑜𝑔10( 1 +
% 𝑓
% 700
% ) .
% Steps:
% 1. Transform fmax and fmin value into mel-frequency domain
% 2. Compute a vector of equally spaced values in the mel-frequency domain ranging from the melfmin
% to the mel-fmax.
% 3. Transform the values into the linear frequency domain.
% 

function edges = melfreqs( fmin,fmax,k )

% caculate the fmin fmax as the formular
fmin=2595*log10(1+fmin/700);

fmax=2595*log10(1+fmax/700);
f=linspace(fmin,fmax,k+2);
edges=zeros(k+2,1);
for i=1:k+2
   edges(i,1)=700* (10.^(f(i)/2595)-1);
    
end

end

