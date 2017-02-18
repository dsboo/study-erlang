-module(shop).
-export([cost/1]). %Name/N -> 인수 N개를 가진 Name이라는 함수라는 뜻, N을 함수의 애리티라고 한다.

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.
