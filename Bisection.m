function [root,ea,iter] = atrue(func, xl,xu,es,maxit,varargin)
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

iter = 0; xr = xl; ea = 100;A = zeros(1,100); B= zeros(1,100); xr2 = xl; xu2 = xu;
while(1)
   wrold = xr;
   xr = (xl + xu)/2;
   iter = iter +1;
   if xr~=0, ea = abs((sqrt(0.1911)-xr)/sqrt(0.1911));
       A(iter) = ea;
        B(iter) = iter;
   end
   test = func(xl,varargin{:})*func(xr,varargin{:});
   if test<0
       xu = xr;
   elseif test>0
       xl = xr;
   else
       ea = 0;
   end
   if ea <= es||iter>=maxit,break,end
end

iter = 0; xl = xr2 ;xu = xu2; ea = 100; C = zeros(1,100); D= zeros(1,100);

while (1)
    xrold = xr;
    fl = func(xl,varargin{:});
    fu = func(xu,varargin{:});
    xr = xu - fu*(xl-xu)/(fl-fu);
    iter = iter +1;
    if xr~=0,  ea = abs((xr-xrold)/xr)*100;
    C(iter) = iter;
    D(iter) = abs(sqrt(0.1911)-xr)/sqrt(0.1911);
    end
    test2 = fl*func(xr,varargin{:});
    if test2<0
        xu = xr;
    elseif test2>0
        xl = xr;
    else 
        ea = 0;
    end
    if ea <= es || iter >= maxit ,break,end
    
end
root = xr;

H = semilogy(B,A, 'b+-', B, D, 'r+-');

set(H,'LineWidth', 1.25);

title('Figure 1. True Relatvie Error');
xlabel('Number of Iterations'); ylabel('True Relative Error'); grid on;
legend('show');
h = legend('Bisection','Flase position');

end