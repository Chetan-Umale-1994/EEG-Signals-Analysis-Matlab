[b a]=butter(1,[f1 f2],'bandpass');
h=freqz(b,a,n2);
plot(f(1:n2),abs(h),'r')
xfilter=filter(b,a,test);
plot(f(1:n2),xfilter);
