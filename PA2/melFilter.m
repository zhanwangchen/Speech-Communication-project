% -------------------------------------------------------------------------
%
% ----

% compute a matrix multiplication between the triangular filter H and
%the absolute
%values of the spectrum of the signal spec
%
function melSpec= melFilter( spec,H )

melSpec=H*abs(spec);

end

% which uses the triangular filter H from exercise E3 and the linear spectrum of the signal spec to compute
% the mel-filtered spectrogram.
% To this end, you have to compute a matrix multiplication between the triangular filter H and the absolute
% values of the spectrum of the signal spec.
% Remember: To perform a matrix multiplication of the matrices A and B, the number of columns of A has
% to equal the number of rows of B. In our case the matrices should have the following dimensions:
% - H: 24 x 257
% - spec: 257 x 176
