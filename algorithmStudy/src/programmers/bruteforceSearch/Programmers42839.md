프로그래머스 : [코딩테스트 연습 - 소수 찾기](https://programmers.co.kr/learn/courses/30/lessons/42839)

---

#### **문제 설명**

한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.

각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.

**제한사항**

-   numbers는 길이 1 이상 7 이하인 문자열입니다.
-   numbers는 0~9까지 숫자만으로 이루어져 있습니다.
-   "013"은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.

**입출력 예**

| **numbers** | **return** |
| --- | --- |
| "17" | 3 |
| "011" | 2 |

**입출력 예 설명**

**예제 #1**  
\[1, 7\]으로는 소수 \[7, 17, 71\]를 만들 수 있습니다.

**예제 #2**  
\[0, 1, 1\]으로는 소수 \[11, 101\]를 만들 수 있습니다.

-   11과 011은 같은 숫자로 취급합니다.

<br>

#### **나의 풀이**

```
import java.util.*;

class Solution {
    HashSet<Integer> set = new HashSet<>();
    
    public int solution(String numbers) {
        combination("", numbers);
        
        int count = 0;
        Iterator<Integer> it = set.iterator();
        while(it.hasNext()) {
            int num = it.next();
            if(isPrime(num)) count++;
        }
        
        return count;
    }
    
    public boolean isPrime(int n) {
        if(n < 2) return false;
        
        //에라토스네테스의 체
        int limit = (int) Math.sqrt(n);
        
        for(int i=2; i<=limit; i++) if(n % i == 0) return false;
        
        return true;
    }
    
    public void combination(String s1, String s2)   {
        if(!s1.equals("")) set.add(Integer.valueOf(s1));
        
        for(int i=0; i<s2.length(); i++) {
            combination(s1 + s2.charAt(i), s2.substring(0, i) + s2.substring(i + 1));
        }
    }
}
```