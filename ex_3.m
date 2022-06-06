Im=imread('img_ex_3/3_s.jpg');
k = 0.025;
Im1 = k .* Im .* (max(Im(:)) - Im);
subplot(1,2,1); imshow(Im); title('before');
subplot(1,2,2); imshow(Im1); title('after');
