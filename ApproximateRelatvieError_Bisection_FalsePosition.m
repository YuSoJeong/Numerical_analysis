function [root,ea,iter] =ApproximateRelatvieError_Bisection_FalsePosition(func, xl,xu,es,maxit,varargin)
%flasepos : root location zerores
% [root,ea,iter] = falsepos(func,xl,xu,es,maxit,p1,pw,...)
%   uses false postion to find the root of func
% input:
% func = name of function
% xl, xu = lower and upper gueeses



%input이 3보다 작을 경우
if nargin<3, error('at least 3 input arguments required'), end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0, error('no sign chang'), end
%input이 4보다 작을 경우에는 es = 0.0001로 초기화 해준다.
if nargin<4||isempty(es), es=0.0001; end
%input이 5보다 작을 경우에는 maxit을 50으로 초기화 해준다.
if nargin<5||isempty(maxit), maxit=50; end

iter = 0; xr = xl; ea = 100;A = zeros(1,100); B= zeros(1,100);  er = 100;
while(1)
    xrold = xr;
    fl = func(xl,varargin{:});
    fu = func(xu,varargin{:});
    xr = xu - fu*(xl-xu)/(fl-fu);
    iter = iter +1;
    if xr ~= 0, ea = abs((xr-xrold)/xr)*100;
         %er = abs(sqrt(0.1911)-xr)/sqrt(0.1911) * 100;
       A(iter) = ea/100;
       B(iter) = iter;
    end
    test = fl*func(xr,varargin{:});
    if test < 0
        xu = xr;
    elseif test>0
        xl = xr;
    else
        ea =0;
    end
    if ea<=es || iter >=100, break, end
end

%같이 사용하는 변수 초기화, 변수 초기화를 해주지 않으면 결과값이 제대로 나오지 않는다.
iter = 0; xr = xl; ea = 100;C=0; D=0;

while(1)
if func(xl)*func(xu)>0
    disp('Wrong interval or interval length too long to find root')
else
    xrold = xr;
    xr = (xl+xu)/2; %interval의 가운데 값을 잡는다.
    iter = iter +1; %iter count를 1증가 시킨다.
    if xr ~=0, ea = abs((xr-xrold)/xr) * 100;
       %er = abs(sqrt(0.1911)-xr)/sqrt(0.1911) * 100;
       D(iter) = ea/100;
       C(iter) = iter;
    end
    %variable arguments for input = varagin ; 입력한 인자의 갯수가 여러개일 때 쓰임.
    test = func(xr,varargin{:})*func(xl, varargin{:});
    if test < 0
        xu = xr;
    elseif test>0
        xl = xr;
    else
        ea = 0;
    end
    if ea<=es || iter>=maxit, break, end
   
end

end

root = xr;

H = semilogy(B,A, 'b+-', C, D, 'r+-');

set(H,'LineWidth', 1.25);

title('Figure 2. Approximate Relatvie Error');
xlabel('Number of Iterations'); ylabel('Approximate Relative Error'); grid on;
legend('show');
h = legend('Flase position', 'Bisection');

end
