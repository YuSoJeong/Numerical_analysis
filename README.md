# Numerical_analysis
수치해석을 위한 매트랩에서의 유용한 코드

# 1) cos_Taylor.m 

 # 코드 설명
 
    f(x) =cos x 인 Taylor Series 를 이용하여, x 가 0 ~ pi/2 에 대해 cos 파형을 나타내는 function 코드이다.
    
 # 입력변수
 
    x=[ 0 : 0.06 : pi/2 ];
    a= pi/4 ; n= 4;
    cos_Taylor ( x, a, n)

 # 결과
 
    0에서 pi/2 까지의 Taylor series 로 근사한 파형이 나타난다.
 
# 2) power.m 

 # 코드 설명
 
    수치해석의 power method 를 구현한 코드이다. 사용자의 선택에 따라서 입력한 대칭행렬의 가장 큰 eigenvlue 또는 가장 작은 eigenvalue 를 구할 수 있고,그에 대응하는 eigenvector 를 구해준다.
 
  # 입력변수
  
    사용자는 초기에 A 대칭행렬, es 허용오차, maxit 최대반복횟수를 입력해 주어야 한다.
    A=[ 40 -20 0 ; -20 40 -20 ; 0 -20 40 ];
    es = 0.05 ; maxit= 100 ;
    [eig_val, eig_vec] = power( A , es , maxit)

 # 결과
 
    0에서 pi/2 까지의 Taylor series 로 근사한 파형이 나타난다.

# 3) True Relatvie Error_Bisection_FalsePosition.m 

 # 코드 설명
 
    수치해석의 root-finding mathod 중 Bisection과 FalsePosition 을 구현한 코드이다.
    사용자가 입력한 함수와 위, 아래 경계조건 , 허용오차, 최대 반복횟수 에 따라
    Bisection 과 FalsePosition을 이용해서 원하는 허용오차 이내로 떨어질 때의 근사값을 결과로 보여주고, 
    최종적으로 Bisection 과 FalsePosition 방법의 반복횟수에 따른 참 상대오차를 그래프로 나타내준다 
 
  # 입력변수
  
    사용자는 초기에 xl 아래 경계값,xu 위 경계값,es 허용오차, maxit 최대반복횟수를 입력해 주어야 한다.
    
    func=사용자가 원하는 함수
    xl=0 ; xu = 1; es = 10^-3 ; maxit= 100;
    [root,ea,iter] = True Relatvie Error_Bisection_FalsePosition(func, xl,xu,es,maxit,varargin)

 # 결과
 
    Bisection과 FalsePosition방법을 통해 각각의 root 의 값을 얻을 수 있고, 반복 횟수에 따른 참 상대오차의 
    그래프를 확인할 수 있다. Bisection 는 xl, xu 의 반을 근사값으로 설정하므로 오히려 실제 근과 더 멀어지는 현상이
    나타날 수 있기에 반복횟수에 따른 참오차의 그래프가 들쑥날쑥하다. 
    
# 4) Approximate Relatvie Error_Bisection_FalsePosition.m 

 # 코드 설명
 
    수치해석의 root-finding mathod 중 Bisection과 FalsePosition 을 구현한 코드이다.
    사용자가 입력한 함수와 위, 아래 경계조건 , 허용오차, 최대 반복횟수 에 따라
    Bisection 과 FalsePosition을 이용해서 원하는 허용오차 이내로 떨어질 때의 근사값을 결과로 보여주고, 
    최종적으로 Bisection 과 FalsePosition 방법의 반복횟수에 따른 근사 상대오차를 그래프로 나타내준다 
 
  # 입력변수
  
    사용자는 초기에 xl 아래 경계값,xu 위 경계값,es 허용오차, maxit 최대반복횟수를 입력해 주어야 한다.
    
    func=사용자가 원하는 함수
    xl=0 ; xu = 1; es = 10^-3 ; maxit= 100;
    [root,ea,iter] = Approximate Relatvie Error_Bisection_FalsePosition(func, xl,xu,es,maxit,varargin)

 # 결과
 
    Bisection과 FalsePosition방법을 통해 각각의 root 의 값을 얻을 수 있고, 
    반복 횟수에 따른 근사 상대오차의 그래프를 확인할 수 있다. 
    
    
    
    
 
 

