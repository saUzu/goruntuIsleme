clc;
clear;
I=imread('Vfo5y.jpg');
I=im2gray(I);
figure,imshow(I),title('Resmin Aslı');
se=strel('square',2);
P=imdilate(I,se);
%figure,imshow(P),title('Yayma');
L = medfilt2(P,[2 2]);
%figure,imshow(L),title('Median Gürültü Engelleme');
se=strel('square',2);
P=imerode(L,se);
P=imfilter(P,ones(2)/4,'replicate');
%figure,imshow(P),title('Kapama');
P = wiener2(P,[15 15]);
L=imadjust(P);
esikDeger = graythresh(L);
L=im2bw(L,esikDeger);
[a,b]=size(L);
L(1:b+50,1:50)=1;       % ufak tefek fazlalıklar bura ve aşağısında düzeltiliyor.
L(1:b+50,500:550)=1;    %
figure,imshow(L),title('Son Hali');