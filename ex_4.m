Im1 = imread('img_ex_4/3_m.jpg');
img = rgb2gray(Im1);
Im2 = imnoise(img,'salt & pepper',0.05);
Im3 = medfilt2(Im2);
subplot(1, 3, 1); imshow(Im1); title('origin');
subplot(1, 3 , 2); imshow(Im2); title('before');
subplot(1, 3 , 3); imshow(Im3); title('after');