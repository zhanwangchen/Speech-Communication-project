

[Y,FS]= audioread('speech1.wav');
% Spectrogram parameters
overlapRatio = 50;
tWin = 0.025;

% Calculate number of samples in each window
nWin = tWin*FS;
nWin = pow2(nextpow2(nWin));
xWin = makeWin(Y,FS,nWin,50);

%To start with, use these threshold values Pth=0.0001; and Zth=0.06;

Pth=0.0003; 
Zth=0.1;

max_time_lag=0.025;
s = size(xWin,2);
pitch = zeros(0,s);


for i = 1:s
    xWinI = xWin(:,i);
    voi = voiced(xWinI, Pth, Zth);
    if voi==1
        fundFre = fundamentalFre(xWinI, max_time_lag,FS);
        pitch(i) = fundFre;
    else
        pitch(i) = nan;
    end

end

t = (length(Y)/FS);

figure

ax(1) = subplot(2,1,1);
Yx = linspace(0,t,size(Y,1));

plot(Yx, Y)
% set grid on the plot
grid on
title('Speech')
xlabel('Time [s]') 
ylabel('Amplitude')

ax(2) = subplot(2,1,2);
pitchx = linspace(0,t,size(pitch,2));

plot(pitchx, pitch)
% set grid on the plot
grid on

title('Pitch-Contour')
xlabel('Time [s]') 
ylabel('Frequency [Hz]')
ylim([50 200])
linkaxes(ax, 'x')
%link the two plot

