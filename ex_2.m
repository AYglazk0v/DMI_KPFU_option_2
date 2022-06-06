I=imread('img_ex_2/4.png'); %Считываем изображение
subplot(1,2,1); imshow(I); title('before'); %Вывод для сравнения
tol=2; % Допуск
rows = size(I,1); cols = size(I,2); %получение размерностей
r=[rows/2; cols/2]; %Стартовая позиция для заливки (центр изображения)
ms=flood_fill(I,r,tol); %Выполняем заливку
cl=[255; 0; 0];%Цвет заливки
R=I(:,:,1); G=I(:,:,2); B=I(:,:,3);
R(ms)=cl(1); G(ms)=cl(2); B(ms)=cl(3);
I(:,:,1)=R; I(:,:,2)=G; I(:,:,3)=B;
subplot(1,2,2); imshow(I); title('after');

function ms=flood_fill(I,r,tol)
    % Алгоритм заливки
    % ms=flood_fill(I,r,tol)
    %  ms - номера пикселей, которые будут закрашены
    % numbering: number=y+szy*(x-1), x y - Координаты пикселя
    % szx szy - размеры изобрадения
    % I - RGB изображение
    % r- первая точка для заливки
    % tol - допуск
    R=int32(I(:,:,1)); G=int32(I(:,:,2)); B=int32(I(:,:,3));
    [szy szx]=size(R);
    stm=10000;
    st=zeros(stm,2,'int32');
    st(1,1)=r(1);st(1,2)=r(2);
    stL=1;
    ms0m=1e6;
    ms0=zeros(ms0m,1,'int32');
    ms0L=0;
    R0=R(r(2),r(1)); G0=G(r(2),r(1));B0=B(r(2),r(1));
    tn=@(xx,yy) yy+szy*(xx-1);
    while true;
        xt=st(stL,1);
        yt=st(stL,2);
        stL=stL-1;
        sku=false; skd=false; sku1=false; skd1=false;
        for xtt=xt:szx

            if max(abs([(R(yt,xtt)-R0), (G(yt,xtt)-G0), (B(yt,xtt)-B0)]))<=tol
                ms0L=ms0L+1;
                ms0(ms0L)=tn(xtt,yt);
            else
                break;
            end
            if yt~=szy
                if max(abs([(R(yt+1,xtt)-R0), (G(yt+1,xtt)-G0), (B(yt+1,xtt)-B0)]))<=tol
                    if ~sku
                        if all(tn(xtt,yt+1)~=ms0(1:ms0L))
                            stL=stL+1;
                            st(stL,1)=xtt;
                            st(stL,2)=yt+1;
                            sku=true;
                        end
                    end
                else
                    sku=false;
                end
                if xtt==xt
                    sku1=sku;
                end
            end
            if yt~=1
                if max(abs([(R(yt-1,xtt)-R0), (G(yt-1,xtt)-G0), (B(yt-1,xtt)-B0)]))<=tol
                    if ~skd
                        if all(tn(xtt,yt-1)~=ms0(1:ms0L)) % if free space
                            % add to stack
                            stL=stL+1;
                            st(stL,1)=xtt;
                            st(stL,2)=yt-1;
                            skd=true;
                        end
                    end
                else
                    skd=false;
                end
                if xtt==xt
                    skd1=skd;
                end
            end
        end
        sku=sku1; skd=skd1;
        if xt~=1
            for xtt=(xt-1):-1:1 
                if max(abs([(R(yt,xtt)-R0), (G(yt,xtt)-G0), (B(yt,xtt)-B0)]))<=tol
                    ms0L=ms0L+1;
                    ms0(ms0L)=tn(xtt,yt);
                else
                    break;
                end
                if yt~=szy
                    if max(abs([(R(yt+1,xtt)-R0), (G(yt+1,xtt)-G0), (B(yt+1,xtt)-B0)]))<=tol
                        if ~sku
                            if all(tn(xtt,yt+1)~=ms0(1:ms0L))
                                stL=stL+1;
                                st(stL,1)=xtt;
                                st(stL,2)=yt+1;
                                sku=true;
                            end
                        end
                    else
                        sku=false;
                    end
                end
                if yt~=1
                    if max(abs([(R(yt-1,xtt)-R0), (G(yt-1,xtt)-G0), (B(yt-1,xtt)-B0)]))<=tol
                        if ~skd
                            if all(tn(xtt,yt-1)~=ms0(1:ms0L))
                                stL=stL+1;
                                st(stL,1)=xtt;
                                st(stL,2)=yt-1;
                                skd=true;
                            end
                        end
                    else
                        skd=false;
                    end
                end
            end
        end
        if stL==0
            break;
        end
    end
ms=ms0(1:ms0L);
end

