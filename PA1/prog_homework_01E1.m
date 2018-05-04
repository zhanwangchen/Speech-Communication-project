


% input in second(s)
max_time_lag = 0.05; 

% read the audio
[Y,FS]= audioread('speech1.wav');

% get the autocorrelation
r_ss = autocorrelation(Y, max_time_lag);

% plot the ACF
time_shift = linspace(0,max_time_lag,size(r_ss,2));
figure
plot(time_shift,r_ss);
xlabel('time lag(s)');
ylabel('autocorrelation r_ss');

% transform column to row 
V2 = r_ss(:);

%Therefore, set the values in the ACF before the first zero crossing to zero.
zerosC =zeroCrossing(V2);
idR_ss = find(zerosC, 1, 'first');
r_ss([1:idR_ss-1])=0;

% find the max value of ACF and its position
[r_ss_max,N] = max(r_ss); 

% caculate the fundamental frequency
T = N/FS;
Fund_Fqy = 1/T;  
disp(Fund_Fqy)






 


