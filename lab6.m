load('jupiterbwnoisy.mat');
fftR = fft2(imNoisy);
figure(1);
imshow(imNoisy, []);
fq = log(abs(ifftshift(fftR)));
figure(2);
imshow(fq, []);


for y = 1 : 1545
    for x = 1 : 1545
        vertical(y, x) = 128 *(1*cos((2*pi*(40*x + 0*y))/1545)+ 1*sin((2*pi*(40*x + 0*y))/1545)+1);
    end
end

for y = 1 : 1545
    for x = 1 : 1545
        horizontal(y, x) = 128 *(1*cos((2*pi*(0*x + 40*y))/1545)+ 1*sin((2*pi*(0*x + 40*y))/1545)+1);
    end
end

fftA = fft2(vertical(1:950,1:1545));
fftB = fft2(horizontal(1:950,1:1545));
im_ans = ifft2(abs(fftR - fftA - fftB).*exp(1i*angle(fftR)));
figure(3);
imshow(uint8(im_ans));
