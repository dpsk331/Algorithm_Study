프로그래머스: [코딩테스트 연습 - H-Index](https://programmers.co.kr/learn/courses/30/lessons/42747)


---

### **문제 설명**

H-Index는 과학자의 생산성과 영향력을 나타내는 지표입니다. 어느 과학자의 H-Index를 나타내는 값인 h를 구하려고 합니다. [위키백과](https://programmers.co.kr/learn/courses/30/lessons/42747?language=java#fn1) 에 따르면, H-Index는 다음과 같이 구합니다.

어떤 과학자가 발표한 논문 n편 중, h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 h의 최댓값이 이 과학자의 H-Index입니다.

어떤 과학자가 발표한 논문의 인용 횟수를 담은 배열 citations가 매개변수로 주어질 때, 이 과학자의 H-Index를 return 하도록 solution 함수를 작성해주세요.

**제한사항**

-   과학자가 발표한 논문의 수는 1편 이상 1,000편 이하입니다.
-   논문별 인용 횟수는 0회 이상 10,000회 이하입니다.

**입출력 예**

| **citations** | **return** |
| --- | --- |
| \[3, 0, 6, 1, 5\] | 3 |

**입출력 예 설명**

이 과학자가 발표한 논문의 수는 5편이고, 그중 3편의 논문은 3회 이상 인용되었습니다. 그리고 나머지 2편의 논문은 3회 이하 인용되었기 때문에 이 과학자의 H-Index는 3입니다.

<br/>

### **나의 풀이**

citations 배열을 정렬 후 h-index를 citations 배열의 길이 값으로 두고, 배열의 처음부터 비교해가면서 h-index의 값을 1씩 감소시켜준다. 처음 h-index보다 크거나 같은 배열의 값을 만날 때 해당 값이 h-index이다.
h-index는 h의 최대값이기 때문에 맨 처음 성립하는 부분이 최대값이 되기 때문에 그 이상은 고려하지 않는다.

```
import java.util.Arrays;

class Solution {
    public int solution(int[] citations) {
        int result = 0;
        int hIndex = citations.length;
        Arrays.sort(citations);
        
        
        for(int i : citations) {
            if(i >= hIndex) {
                result = hIndex;
                break;
            }
            
            hIndex--;
        }
        
        return result;
    }
}
```

<br/>

### **오늘의 배움 📚**

-   java.lang.Math > java.lang 패키지는 이미 내장되어 있어서 import가 필요 없다!
    -   버림: Math.floor()
    -   반올림: Math.round()
    -   올림: Math.ceil()
    -   절대값: Math.abs()
