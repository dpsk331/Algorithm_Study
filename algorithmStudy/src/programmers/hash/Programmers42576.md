 프로그래머스: [코딩테스트 연습 - 완주하지 못한 선수](https://programmers.co.kr/learn/courses/30/lessons/42576?language=java)

---

### **문제 설명**

수많은 마라톤 선수들이 마라톤에 참여하였습니다. 단 한 명의 선수를 제외하고는 모든 선수가 마라톤을 완주하였습니다.

마라톤에 참여한 선수들의 이름이 담긴 배열 participant와 완주한 선수들의 이름이 담긴 배열 completion이 주어질 때, 완주하지 못한 선수의 이름을 return 하도록 solution 함수를 작성해주세요.

**제한사항**

-   마라톤 경기에 참여한 선수의 수는 1명 이상 100,000명 이하입니다.
-   completion의 길이는 participant의 길이보다 1 작습니다.
-   참가자의 이름은 1개 이상 20개 이하의 알파벳 소문자로 이루어져 있습니다.
-   참가자 중에는 동명이인이 있을 수 있습니다.

**입출력 예**

| **participant** | **completion** | **return** |
| --- | --- | --- |
| \["leo", "kiki", "eden"\] | \["eden", "kiki"\] | "leo" |
| \["marina", "josipa", "nikola", "vinko", "filipa"\] | \["josipa", "filipa", "marina", "nikola"\] | "vinko" |
| \["mislav", "stanko", "mislav", "ana"\] | \["stanko", "ana", "mislav"\] | "mislav" |

**입출력 예 설명**

예제 #1  
"leo"는 참여자 명단에는 있지만, 완주자 명단에는 없기 때문에 완주하지 못했습니다.

예제 #2  
"vinko"는 참여자 명단에는 있지만, 완주자 명단에는 없기 때문에 완주하지 못했습니다.

예제 #3  
"mislav"는 참여자 명단에는 두 명이 있지만, 완주자 명단에는 한 명밖에 없기 때문에 한명은 완주하지 못했습니다.

<br/>

### **나의 풀이**

**❌ 정확성은 통과되지만, 효율성이 실패한 풀이**

\- 해당 문제는 해시 맵 사용해야 함 : )

```
import java.util.Arrays;
import java.util.ArrayList;

class Solution {
    public String solution(String[] participant, String[] completion) {
        ArrayList<String> participantList = new ArrayList<>(Arrays.asList(participant));
        ArrayList<String> completionList = new ArrayList<>(Arrays.asList(completion));
        String answer = "";
        
        for(int i=0; i<participantList.size(); i++) {
            if(completionList.contains(participantList.get(i))) {
                completionList.remove(participantList.get(i));
            } else {
                answer = participantList.get(i);
                break;
            }
        }

        return answer;
    }
}
```

**⭕ HashMap 사용 풀이**

```
import java.util.HashMap;

class Solution {
    public String solution(String[] participant, String[] completion) {
        String answer = "";
        HashMap<String, Integer> hashMap = new HashMap<>();
        
        for(String p : participant) {
            if(hashMap.containsKey(p)) {
                hashMap.put(p, hashMap.get(p) + 1);
            } else {
                hashMap.put(p, 1);
            }
        }
        
        for(String c : completion) {
            hashMap.replace(c, hashMap.get(c) -1);
            if(hashMap.get(c) == 0) {
                hashMap.remove(c);
            }
        }
        
        for(String i : hashMap.keySet()){
            answer = i;
        }
        return answer;
    }
}
```

<br/>

### **오늘의 노력 🤦‍♀️**

-   import.util.ArrayList
-   Array ⇆ List > [참고](https://mommoo.tistory.com/32)

<br/>


### **오늘의 배움 📚**

**다른 사람의 풀이**

```
import java.util.HashMap;

class Solution {
    public String solution(String[] participant, String[] completion) {
        String answer = "";
        HashMap<String, Integer> hm = new HashMap<>();
        for (String player : participant) hm.put(player, hm.getOrDefault(player, 0) + 1);
        for (String player : completion) hm.put(player, hm.get(player) - 1);

        for (String key : hm.keySet()) {
            if (hm.get(key) != 0){
                answer = key;
            }
        }
        return answer;
    }
}
```

-   import.util.HashMap > getOrDefault() 메소드
-   HashMap은 이분탐색으로 log₂N의 시간복잡도를 갖는다.