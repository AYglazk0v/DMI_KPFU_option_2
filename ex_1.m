%задание один,трептугольник

artax = - 20 + 40.*rand (4,1);

tarangle = randi([10 75], 1, 2);

side_a = sqrt((artax(2) - artax(1))^2 + (artax(4) - artax(3))^2);
side_b = (side_a * ((sin(pi*tarangle(1)/180)) / (sin(pi *  (180 - tarangle(2) - tarangle(1)) / 180));
side_c = (side_a * ((sin(pi*tarangle(2)/180)) / (sin(pi *  (180 - tarangle(2) - tarangle(1)) / 180));

x1 = artax(1);
x2 = artax(2);
y1 = artax(3);
y2 = artax(4);syms

syms x y;
equs = [side_b^2 == sqrt((x - x2)^2 + (y - y2)^2), side_c^2 == sqrt((x - x1)^2 + (y - y1)^2)];
vars = [x,y];
Sol = solve(equs,vars);
x3 = double(Sol.x(1,1));
y3 = double(Sol.y(1,1));

Matrix = [x1 y1 1; x2 y2 1; x3 y3 1];
Rot = [cos(pi*50/180) sin(pi*50/180); -sin(pi*50/180) cos(pi*50/180)];
Scale = [sqrt(1.5) 0; 0 sqrt(1.5)];
Mat_Rot = Matrix*Rot;
Final_Mat = Mat_Rot*Scale;

M = Matrix;
FM = Final_Mat;

Tr_1 = [M(1,1) M(1,2); M(2,1) M(2,2); M(3,1) M(3,2)];
Tr_2 = [FM(1,1) FM(1,2); FM(2,1) FM(2,2); FM(3,1) FM(3,2)];

line([-10,10], [-19, 21], 'Color', 'k');

line([M(1,1),M(2,1)], [M(1,2), M(2,2)], 'Color', 'r');
hold on;
line([M(2,1), M(3,1)], [M(2,2), M(3,2)], 'Color', 'r');
line([M(3,1), M(1,1)], [M(3,2), M(1,2)], 'Color', 'r');


line([FM(1,1),FM(2,1)], [FM(1,2), FM(2,2)], 'Color', 'b');
hold on;
line([FM(2,1),FM(3,1)], [FM(2,2), FM(3,2)], 'Color', 'b');
line([FM(3,1), FM(1,1)], [FM(3,2), FM(1,2)], 'Color', 'b');
