function [vs, t] = raw_signal(filename)
vs = xlsread(filename, '', 'D:D');
sample_interval=1/512;
n_points=length(vs);
t = 0:sample_interval:(n_points*sample_interval)-sample_interval;
%{
plot(t,vs);
title('RAW EEG SIGNAL');
xlabel('Seconds');
ylabel('micro Volts');
%}

fs=512;

if mod(n_points,2)~=0
    n_points=n_points-1;
else 
    n_points=n_points;
end
bin_val = [0 : n_points-1];
n2=n_points/2;
f=bin_val/n2;
z = fftshift(fft(vs));
z1=abs(z);
psd=z1.^2;
pre_filter=psd(n2:n_points-1);
%{
disp(n2);
disp(length(f(1:n2)));
disp(length(psd));
disp(length(pre_filter));
%}
%{
plot(f(1:n2),psd(n2-1:n_points-1));
title('power spectrum');
xlabel('frequency(HZ)');
ylabel('power');
%}
f1=0.1/256;
f2=3/256;
f3=4/256;
f4=7/256;
f5=8/256;
f6=12/256;
f7=13/256;
f8=30/256;


%[b1 a1]=butter(1,[f1 f2] ,'bandpass');
%[b2 a2]=butter(1,f1,'high');
%h=freqz(b1,a1,n2);
%plot(f(1:n2),abs(h),'r')
%{
%xfilter1=filter(b1,a1,test);
%xfilter2=filter(b2,a2,xfilter1);
plot(f(1:n2),xfilter1);
fz1=f(1:n2);
b=xfilter1(fz1>0.05 & fz1 < 0.11);
c=fz1(fz1>0.05 & fz1 < 0.11);
%plot(c,b);
%}

%{
fz1=f(1:n2);
x=find(fz1==0.031);
y=find(fz1==0.05);
fz2=fz1(fz1>=0.03 & fz1<=0.05);
disp(x);
disp(y);

disp(fz2);

xfilter2=xfilter1(x:y);

disp(length(fz2));
disp(length(xfilter2));
%}
%{
area1=trapz(f(1:n2),xfilter1);
%disp(length(f(1:n2)));
%disp(length(xfilter));
area2=area1/5;
disp(area1);
disp(area2);
%}

%}


[b1 a1]=butter(1,[f1 f2] ,'bandpass');
[b2 a2]=butter(1,[f3 f4],'bandpass');
[b3 a3]=butter(1,[f5 f6] ,'bandpass');
[b4 a4]=butter(1,[f7 f8],'bandpass');

post_filter1=filter(b1,a1,pre_filter);
post_filter2=filter(b2,a2,pre_filter);
post_filter3=filter(b3,a3,pre_filter);
post_filter4=filter(b4,a4,pre_filter);

area1=trapz(f(1:n2),post_filter1);
area2=trapz(f(1:n2),post_filter2);
area3=trapz(f(1:n2),post_filter3);
area4=trapz(f(1:n2),post_filter4);

esd_delta=abs(area1)/3;
esd_theta=abs(area2)/3;
esd_alpha=abs(area3)/4;
esd_beta=abs(area4)/17;

disp(esd_alpha);
disp(esd_beta);


total_power=esd_delta+esd_theta+esd_alpha+esd_beta;
disp(total_power);
rer_alpha=log10((esd_alpha/total_power));
rer_beta=log10((esd_beta/total_power));
disp(rer_alpha);
disp(rer_beta);






grid on;
grid minor;
end
