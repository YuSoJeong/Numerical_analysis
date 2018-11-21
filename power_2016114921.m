function [eig_val,eig_vec] = power_2016114921( A,es,maxit)

%UNTITLED Summary of this function goes here

%   Detailed explanation goes here

Choice=input('���� ū eigenvalue(1) ? ���� ���� eigenvalue(2) ? :');
T=false;
[row col]=size(A);

if(row==col)

   disp('�Է��� matrix�� ������ ����̴�.');

   if symetriccheck(A,row,col),disp('�׸��� ��Ī����̴�.'); T=true;
   else error('�׸��� ��Ī����� �ƴϴ�'); 
   end
   
else error('�Է��� matrix�� ������ ����� �ƴϴ�.');

end

if(T)
    if Choice==1,disp('���� ū ���');[eig_val,eig_vec] = check(A,es,maxit,row);

    elseif Choice==2,
        disp('���� ���� ���');
        A=inv(A);

       [eig_val2,eig_vec2] = check(A,es,maxit,row);    

        eig_val=1/eig_val2;

        eig_vec=eig_vec2;
    else error('no! 1,2 �� �� �ϳ��� �Է��ϼ���.');
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
 
