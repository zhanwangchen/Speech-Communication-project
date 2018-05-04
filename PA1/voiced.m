function voi = voiced(x, Pth, Zth)

% Power Px and zero crossing Zx measures.

% Number of power estimates to make.

Px = mean(x.*x);


Zx = mean( zeroCrossing(x) );

% Compare estimates with threshold values.
voi = (Px>Pth) & (Zx<Zth);
end