
fs=512;
bin_val = [0 : n_points-1];
n2=ceil(n_points/2);
f=bin_val/n2;



z = fftshift(fft(vs));
z1=abs(z);
psd=z1.^2;
plot(f(1:n2),psd(n2:n_points-1));
title('power spectrum');
xlabel('frequency(HZ)');
ylabel('power');


