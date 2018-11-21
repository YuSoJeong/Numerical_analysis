function cos_Taylor_2016114921( x,a,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nargin<2 || isempty(a), a=pi/4;end
if nargin<3 || isempty(n), n=4;end

Gyesu=1;
MatrixNum=2;

A=[cos(a),-sin(a),-cos(a),sin(a)];
y=x-a;
f=A(1);

for j=n:-1:1

    f = f+(A(MatrixNum)*(y.^Gyesu))/factorial(Gyesu);

    Gyesu=Gyesu+1;
    MatrixNum=MatrixNum+1;

    if(MatrixNum==4)
        MatrixNum=1;
    end

end

c=f;

plot(x,c,'g:o'),title('c versus t'),xlabel('radian'),ylabel('cos')

 

end

