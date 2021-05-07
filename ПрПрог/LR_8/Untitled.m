for id=1:6
sec=id*2-1;
t=out_data.time;
y=out_data.signals(id).values;
subplot(6,2,sec);
plot(t,y);
z=fft(y,1024);
z1=abs(z);
subplot(6,2,sec+1);
stem(1:50,z1(1:50));
end
