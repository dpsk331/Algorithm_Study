프로그래머스: [코딩테스트 연습 - 가장 큰 수](https://programmers.co.kr/learn/courses/30/lessons/42746?language=java)

---

### **문제 설명**

0 또는 양의 정수가 주어졌을 때, 정수를 이어 붙여 만들 수 있는 가장 큰 수를 알아내 주세요.

예를 들어, 주어진 정수가 \[6, 10, 2\]라면 \[6102, 6210, 1062, 1026, 2610, 2106\]를 만들 수 있고, 이중 가장 큰 수는 6210입니다.

0 또는 양의 정수가 담긴 배열 numbers가 매개변수로 주어질 때, 순서를 재배치하여 만들 수 있는 가장 큰 수를 문자열로 바꾸어 return 하도록 solution 함수를 작성해주세요.

<br/>

**제한 사항**

-   numbers의 길이는 1 이상 100,000 이하입니다.
-   numbers의 원소는 0 이상 1,000 이하입니다.
-   정답이 너무 클 수 있으니 문자열로 바꾸어 return 합니다.

<br/>

**입출력 예**

| **numbers** | **return** |
| --- | --- |
| \[6, 10, 2\] | "6210" |
| \[3, 30, 34, 5, 9\] | "9534330" |

<br/>

### **나의 풀이**

```
import java.util.Arrays;
import java.util.Comparator;

class Solution {
    public String solution(int[] numbers) {
        //문자열 배열로 변경
        String[] numberStr = new String[numbers.length];
        for(int i=0; i<numbers.length; i++) {
            numberStr[i] = String.valueOf(numbers[i]);
        }
            
        //비교 후 정렬
        Arrays.sort(numberStr, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return ((o2 + o1).compareTo(o1 + o2));
            }
        });
        
        //정렬 후에도 result[0]의 값이 0일 경우 최대값은 무조건 0
        if(numberStr[0].equals("0")) return "0";
        
        String answer = "";
		// 정렬된 문자 하나로 합치기
		for (String a : numberStr) {
			answer += a;
		}
        
		return answer;  
    }
}
```

<br/>

### **오늘의 노력 🤦‍♀️**

1\. 순열과 조합을 생각함. 순열로 모든 경우의 수를 다 만들어 보는 방법을 생각했는데 시간 낭비, 메모리 낭비라서 패스

-   순열과 조합 > [참고](https://kcms.tistory.com/entry/%EC%88%9C%EC%97%B4%EA%B3%BC-%EC%A1%B0%ED%95%A9-%EA%B8%B0%EB%B3%B8%EA%B0%9C%EB%85%90%EA%B3%BC-%EA%B3%84%EC%82%B0)
-   순열 > [참고](https://mathbang.net/545)
-   자바 순열 > [참고](https://bcp0109.tistory.com/14)
-   자바 팩토리얼 > [참고](http://mwultong.blogspot.com/2007/01/java-factorial-1100-0100-n.html)
-   자바 BigInteger > [참고1](https://coding-factory.tistory.com/604), java.math.BigInteger

2\. 정렬해서 자리수마다 비교 후 값이 큰 값을 순서대로 결과값으로 만들기(수작업)

**3\. 2번의 방법을 수작업으로 하려던 중 다른 분들의 자료를 참고하여 찾게 된 Comparator 이용 방법 ✅**

-   [참고 풀이](https://codevang.tistory.com/294)  
    -   +람다식 사용 풀이

```
import java.util.Arrays;
import java.util.Comparator;

class Solution {

	public String solution(int[] numbers) {

		// 숫자를 문자열로 변환
		String[] result = new String[numbers.length];
		for (int i = 0; i < numbers.length; i++) {
			result[i] = String.valueOf(numbers[i]);
		}

		// 정렬
		Arrays.sort(result, (o1, o2) -> (o2 + o1).compareTo(o1 + o2));

		// 0만 여러개 있는 배열의 경우 하나의 0만 리턴
		if (result[0].equals("0")) {
			return "0";
		}

		String answer = "";
		// 정렬된 문자 하나로 합치기
		for (String a : result) {
			answer += a;
		}
		return answer;
	}
}
```

<br/>

### **오늘의 배움 📚**

-   Comparable과 Comparator > [참고](https://st-lab.tistory.com/243)
-   Comparator > java.util Interface Comparator<T>
-   Arrays의 sort() > java.util.Arrays
