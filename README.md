# Numerical_analysis
수치해석을 위한 매트랩에서의 유용한 코드

# 1) cos_Taylor.m 

 # <코드 설명>
 
    f(x) =cos x 인 Taylor Series 를 이용하여, x 가 0 ~ pi/2 에 대해 cos 파형을 나타내는 function 코드이다.
    
 # <입력변수>
 
    x=[ 0 : 0.06 : pi/2 ];
    a= pi/4 ; n= 4;
    cos_Taylor ( x, a, n)

 # <결과>
 
    0에서 pi/2 까지의 Taylor series 로 근사한 파형이 나타난다.
 
# 2) power.m 

 # <코드 설명>
 
    수치해석의 power method 를 구현한 코드이다. 사용자의 선택에 따라서 입력한 대칭행렬의 가장 큰 eigenvlue 또는 가장 작은 eigenvalue 를 구할 수 있고,그에 대응하는 eigenvector 를 구해준다.
 
  # <입력변수>
  
    사용자는 초기에 A 대칭행렬, es 허용오차, maxit 최대반복횟수를 입력해 주어야 한다.
    A=[ 40 -20 0 ; -20 40 -20 ; 0 -20 40 ];
    es = 0.05 ; maxit= 100 ;
    [eig_val, eig_vec] = power( A , es , maxit)

 # <결과>
 
    0에서 pi/2 까지의 Taylor series 로 근사한 파형이 나타난다.

 
 

