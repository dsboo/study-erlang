-module(lib_misc).
-export([pythag/1]).
-export([perms/1]).
%% A + B + C 가 N보다 작거나 같고
%% A*A + B*B가 C*C와 같은
%% A의 모든값, B의 모든 값, C의 모든 값(1~N)
%% 의 집합, 
pythag(N) -> [
				{A,B,C} || 
					A <- lists:seq(1,N),
					B <- lists:seq(1,N),
					C <- lists:seq(1,N),
					A+B+C =< N,
					A*A+B*B =:= C*C % ,로 구분되는 식을 모두만족해야함
			].

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])]. % -- 리스트 연산자 XL - YL, XL리스트에서 YL 리스트의 요소를 뺀 나머지 
