프로그래머스: [코딩테스트 연습 - 위장](https://programmers.co.kr/learn/courses/30/lessons/42578)

---

### **문제 설명**

스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다.

예를 들어 스파이가 가진 옷이 아래와 같고 오늘 스파이가 동그란 안경, 긴 코트, 파란색 티셔츠를 입었다면 다음날은 청바지를 추가로 입거나 동그란 안경 대신 검정 선글라스를 착용하거나 해야 합니다.

| **종류** | **이름** |
| --- | --- |
| 얼굴 | 동그란 안경, 검정 선글라스 |
| 상의 | 파란색 티셔츠 |
| 하의 | 청바지 |
| 겉옷 | 긴 코트 |

스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return 하도록 solution 함수를 작성해주세요.

**제한사항**

-   clothes의 각 행은 \[의상의 이름, 의상의 종류\]로 이루어져 있습니다.
-   스파이가 가진 의상의 수는 1개 이상 30개 이하입니다.
-   같은 이름을 가진 의상은 존재하지 않습니다.
-   clothes의 모든 원소는 문자열로 이루어져 있습니다.
-   모든 문자열의 길이는 1 이상 20 이하인 자연수이고 알파벳 소문자 또는 '\_' 로만 이루어져 있습니다.
-   스파이는 하루에 최소 한 개의 의상은 입습니다.

**입출력 예**

| **clothes** | **return** |
| --- | --- |
| \[\["yellowhat", "headgear"\], \["bluesunglasses", "eyewear"\], \["green\_turban", "headgear"\]\] | 5 |
| \[\["crowmask", "face"\], \["bluesunglasses", "face"\], \["smoky\_makeup", "face"\]\] | 3 |

**입출력 예 설명**

**예제 #1**  
headgear에 해당하는 의상이 yellow\_hat, green\_turban이고 eyewear에 해당하는 의상이 blue\_sunglasses이므로 아래와 같이 5개의 조합이 가능합니다.

> 1\. yellow\_hat  
> 2\. blue\_sunglasses  
> 3\. green\_turban  
> 4\. yellow\_hat + blue\_sunglasses  
> 5\. green\_turban + blue\_sunglasses

**예제 #2**  
face에 해당하는 의상이 crow\_mask, blue\_sunglasses, smoky\_makeup이므로 아래와 같이 3개의 조합이 가능합니다.

> 1\. crow\_mask  
> 2\. blue\_sunglasses  
> 3\. smoky\_makeup

<br>

### **나의 풀이**

-   옷의 종류별 수량은 아예 아무것도 입지 않는 것을 포함해 계산하기 때문에 +1 해줘서 조합을 구하는 것이다!
-   마지막 -1은 모든 종류의 옷을 모두 다 안 입은 경우를 빼준 것이다.

```
import java.util.*;

class Solution {
    public int solution(String[][] clothes) {
        int answer = 1;
        Map<String, Integer> map = new HashMap<>();
        
        for(String[] arr : clothes) map.put(arr[1], map.getOrDefault(arr[1], 0) + 1);

        for(String key : map.keySet()) answer *= (map.get(key) + 1);

        return answer-1;
    }
}
```

<br>

### **오늘의 배움 📚**

-   import java.util.Map > getOrDefault( , )
    -   해당 키의 value가 없을 경우 기본 값 설정 가능