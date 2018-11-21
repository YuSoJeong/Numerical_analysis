function [eig_val,eig_vec] = power_2016114921( A,es,maxit)

%UNTITLED Summary of this function goes here

%   Detailed explanation goes here

Choice=input('가장 큰 eigenvalue(1) ? 가장 작은 eigenvalue(2) ? :');
T=false;
[row col]=size(A);

if(row==col)

   disp('입력한 matrix는 스퀘어 행렬이다.');

   if symetriccheck(A,row,col),disp('그리고 대칭행렬이다.'); T=true;
   else error('그리고 대칭행렬이 아니다'); 
   end
   
else error('입력한 matrix는 스퀘어 행렬이 아니다.');

end

if(T)
    if Choice==1,disp('가장 큰 경우');[eig_val,eig_vec] = check(A,es,maxit,row);

    elseif Choice==2,
        disp('가장 작은 경우');
        A=inv(A);

       [eig_val2,eig_vec2] = check(A,es,maxit,row);    

        eig_val=1/eig_val2;

        eig_vec=eig_vec2;
    else error('no! 1,2 둘 중 하나를 입력하세요.');
    end
 end
end

 

function y=symetriccheck(A,row,col)
    y=true;
    for i=1:row
        for j=col:row
            if A(i,j)~=A(j,i),y=false;end
        end
    end

end

function [eig_val,eig_vec]=check(A,es,maxit,row)
 x=ones(1,row)'; iter=0;  xr=0;
 
 while(1)
    xrold=xr;
    s=A*x;
    xr=s(1);
    
        for i=2:length(s) 
          j=abs(s(1));
          if j<abs(s(i)),xr=s(i);end
        end
   
    newxr=s/xr;
    iter=iter+1;

    if xr~=0,ea=abs((xr-xrold)/xr)*100;end
    if ea<=es || iter>=maxit,break,end
    x=newxr;
 end
 eig_val=xr;
 eig_vec=newxr;
end
 
