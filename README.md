# study-erlang

## 1,2장

애텀 == enum으로 생각하면 됨
모든 변수명은 대문자로 시작한다.
=:= 값의 동일성을 검사한다. like equal
rem =:= % modular 연산이다.
애리티는 함수의 인자수를 가르킨다. f(A,B). 2개의 애리티
, 쉼표는 함수호출, 데이터 생성자 패턴에서 인수를 구분 f(a, b)
. 마침표는 전체함수롤 구분하고 쉘에서 식을 구분한다. X=f(a,b).
; 세미콜론은 절을 구분한다. \\ pattern1 -> expression1; pattern2 -> expression2.

## 3장

### 산술연산자

| Op | description | 인수타입 | 우선순위 |
| +X | +X | number | 1 |
| -X | -X | number | 1 |
| X*Y | X*Y | number | 2 |
| X/Y | X/Y(소수점 나누기) | number | 2 |
| bnot X | X의 비트 NOT | integer | 2 |
| X div Y | X와 Y의 나누기 |integer  | 2 |
| X rem Y | X를 Y로 나눈 나머지 | integer | 2 |
| X band Y | X와 Y의 비트 AND | integer | 2 |
| X+Y | X+Y | number | 3 |
| X-Y | X-Y | number | 3 |
| bor | X와 Y의 비트 OR | integer | 3 |
| bxor | X와 Y의 비트 XOR | integer | 3 |
| bsl | X를 산술적응로 N비트 좌측 비트이동 | integer | 3 |
| bsr | X를 N비트 우측 비트이동 | integer | 3 |

### 가드

가드는 패턴 매칭의 능력을 증가시키는 데 사용할 수 있는 구조다. 가드를 가용하면, 패턴에 있는 변수에 대해 간단한 테스트와 비교를 수행할 수 있다.
가드 시퀀스 G1;G2;G3 중 어느 하나만 만족하면 참이다.
G1, G2, G3는 모든 가드표현을 만족해야 참이다.
is_tuple(T), size(T) =:= 6, abs(element(3,T)) > 5 T가 요소를 6개 가지는 튜플이며 3번째 요소가 5보다 크면 참이된다.
X =:= dog; X=:= cat X가 dog 이거나 cat이면 만족된다는 의미

shot-curcuit은 orelse andalso 연산자에서만 동작한다.

### 레코드

    record (Name, { %키는 무조건 애텀이어야 한다. \\

					%% 다음 두개의 key는 디폴트 값 \\
					key1=default1, \\
					key2=default2, \\
					%% 다음 줄은 key3=undefined와 동일함 \\
					key3 \\
    })

### case 식

    filer(P, [H|T]) ->
	    case P(H) of
		    true -> [H|filter(P,T)]; % P(H)가 true로 평가되면 수행
		    false -> filter(P,T)
	    end;
    filter(P, []) -> [].

### if

	if Guard1 -> exp1;
		Guard2 -> exp2;
		Guard3 -> exp3; % if else 구문
		true -> exp4 % else구문
	end

### 예외 처리

	try expr of
	 ptn1 [when guard] -> expr1
	 ptn2 [when guard] -> expr2
	 ptn3 [when guard] -> expr3
	catch
	 exceptionType : ExceptionPtn1 [when guard] -> ExExpr1;
	 exceptionType : ExceptionPtn2 [when guard] -> ExExpr2;
	after
	 AfterExpr
	end

	%축약형
	try expr
	catch
	..
	end

#### 흔히 오류를 반환하는 코드

	case f(X) of
		{ok, val} -> do_something(val);
		{error, Why} -> 오류처리
	end.

	
	{ok, val} = f(X). % f(x)가 {error,Why}를 반환하는 경우, 예외발생 
	do_something(val);
	


#### 모든 예외 잡기 like try{ }catch(Exception e){ }

	try Expr
	catch
		 _:_ -> 모든 예외를 처리하는 코드
	end

### 스택추적

	erlang:get_stacktrace()

	demo3() ->
		try genetate_exception(5)
		catch
			error:X ->
				{X, erlang:get_stacktrace()}
		end.

	 {a,
	  [%stacktrace 시작부분 
	   {try_test,generate_exception,1}, % 모듈명, 함수명, 애리티
	   {try_test,demo3,0},
	   ...
	  ]
	 }


