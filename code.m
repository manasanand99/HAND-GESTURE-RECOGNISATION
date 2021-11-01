clc 
close all 
vid=videoinput('winvideo',1); 
figure;title("video input"); 
set(vid,'ReturnedColorspace','rgb') pause(2); 
img_input=getsnapshot(vid); figure;
title("input image");
imshow(img_input);
title('sign'); 
img_height = size(img_input,1); 
img_width = size(img_input,2);
%Initialize the images 
out = img_input; 
bin = zeros(img_height,img_width); 
% result - Color Balanced 24-bit RGB Image 
result = uint8(zeros(size(img_input,1), size(img_input,2), size(img_input,3))); 
%R,G,B components 
R = img_input(:,:,1); 
G = img_input (:,:,2);
B = img_input (:,:,3); 
%Inverse of the Avg values 
mR = 1 /(mean(mean(R))); 
mG = 1 /(mean(mean(G))); 
mB = 1 /(mean(mean(B)));
%Calculate the Smallest Avg Value 
max_RGB = max(max(mR, mG), mB); 
% Compute the scaling factors 
mR = mR/max_RGB; 
mG = mG/max_RGB; 
mB = mB/max_RGB; 
%Calculate the scale values 
result(:,:,1) = R*mR; 
result(:,:,2) = G*mG; 
result(:,:,3) = B*mB; 
%Apply Grayworld Algorithm 
Img_gray =grayworld(img_input);
%Convert from RGB to YCbCr 
imgycbcr = rgb2ycbcr(Img_gray); 
YCb = imgycbcr(:,:,2); 
YCr = imgycbcr(:,:,3);
%Detect Human Skin 
[r,c,v] = find(YCb>=77 & YCb<=127 & YCr>=133& YCr<=173); 
numind = size(r,1);
%Mark Humain Skin Pixels 
for i=1:numind 
out(r(i),c(i),:) = [0 0 255]; 
bin(r(i),c(i)) = 1; 
end
bin=imresize(bin, [64 80]); 
Folder = 'C:\Users\hp\Documents\Hand-Gesture-Recognition'; 
File = 'bin.png'; imwrite(bin,strcat('bin','.png')); 
figure; imshow(out);title('skin color detection'); 
figure; imshow(bin);
img_input= imresize(img_input, [64 70]); 
Folder = 'C:\Users\hp\Documents\Hand-Gesture-Recognition'; 
File = 'img_input.png'; 
imwrite(img_input,strcat('bin1','.png')); 
small1 = rgb2gray(imread('bin1.png')); 
big1 = rgb2gray(imread('sign.jpg')); 
lvl1 = graythresh(small1); 
small =im2bw(small1,lvl1); 
big=im2bw(big1,0.4); 
imshowpair(big,bin,'montage');title('template pair'); 
c = normxcorr2(bin,big);
%figure, surf(c), shading flat 
[ypeak, xpeak] = find(c==max(c(:))); 
yoffSet = ypeak-size(bin,1); 
xoffSet = xpeak-size(bin,2); 
figure imshow(big);title('sign detection'); 
disp (xoffSet+1) 
disp (yoffSet+1) 
disp (size(bin,2)) 
disp (size(bin,1)) 
imrect(gca, [xoffSet+1 yoffSet+1 size(bin,2) size(bin,1)]);
axis on 
if(xoffSet>1 && xoffSet<40 && yoffSet>6 && yoffSet<78) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'a' ); 
end
if(xoffSet>76 && xoffSet<140 && yoffSet>6 && yoffSet<78) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'b' ); 
end
if(xoffSet>143 && xoffSet<169 && yoffSet>6 && yoffSet<78) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'c' ); 
end
if(xoffSet>199 && xoffSet<232 && yoffSet>6 && yoffSet<78) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'd' ); 
end
if(xoffSet>250 && xoffSet<288 && yoffSet>6 && yoffSet<78) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'e' ); 
end
if(xoffSet>313 && xoffSet<350 && yoffSet>6 && yoffSet<78) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'f' ); 
end
if(xoffSet>392 && xoffSet<420 && yoffSet>6 && yoffSet<78) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'g' ); 
end
if(xoffSet>1 && xoffSet<40 && yoffSet>120 && yoffSet<186) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'h' ); 
end
if(xoffSet>92 && xoffSet<127 && yoffSet>120 && yoffSet<186) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'i' ); 
end
if(xoffSet>174 && xoffSet<200 && yoffSet>120 && yoffSet<186) 
NET.addAssembly('System.Speech'); 
obj = System.Speech.Synthesis.SpeechSynthesizer; 
obj.Volume = 100; 
Speak(obj, 'j' ); 
end






