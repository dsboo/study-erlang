-module(shop2).
-export([total/1]).%total/1 함수는 모듈 shop2밖에서 호출될 수 있다는 의미. 모듈로부터 익스포트한 함수들만 모듈 밖에서 호출 가능
-import(lists,[map/2, sum/1]). %lists 모듈에서 map/2, sum/1 함수를 임포트함

total(L) -> sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).
