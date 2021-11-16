프로그래머스 : [코딩테스트 연습 - 타겟 넘버](https://programmers.co.kr/learn/courses/30/lessons/43165)

---

#### **문제 설명**

n개의 음이 아닌 정수가 있습니다. 이 수를 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 \[1, 1, 1, 1, 1\]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.

```
-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3
```

사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.

**제한사항**

-   주어지는 숫자의 개수는 2개 이상 20개 이하입니다.
-   각 숫자는 1 이상 50 이하인 자연수입니다.
-   타겟 넘버는 1 이상 1000 이하인 자연수입니다.

**입출력 예**

| numbers | target | return |
| --- | --- | --- |
| \[1, 1, 1, 1, 1\] | 3 | 5 |

#### **나의 풀이**

```
class Solution {
    int[] arr;
    int answer = 0;
    
    public int solution(int[] numbers, int target) {
        arr = numbers;
        
        dfs(0, 0, target);
        
        return answer;
    }
    
    public void dfs(int sum, int i, int target) {
        if(i == arr.length) {
            if(sum == target) answer++;
            return;
        }
        
        dfs(sum+arr[i], i+1, target);
        dfs(sum-arr[i], i+1, target);
     } 
}
```

#### **오늘의 배움 📚**

[\[알고리즘\] 깊이 우선 탐색(DFS) 과 너비 우선 탐색(BFS)

\[알고리즘\] 깊이 우선 탐색(DFS)과 너비 우선 탐색(BFS) 그래프를 탐색하는 방법에는 크게 깊이 우선 탐색(DFS)과 너비 우선 탐색(BFS)이 있습니다. 📌여기서 그래프란, 정점(node)과 그 정점을 연

devuna.tistory.com](https://devuna.tistory.com/32)

-   **깊이 우선 탐색(DFS)**는 **스택/재귀**
-   **너비 우선 탐색(BFS)**는 **큐**

#### **실행 결과**

[##_Image|kage@CKS1E/btrkA7MOFEv/aAUzYx6JXcKBEK8FRBSGK0/img.png|CDM|1.3|{"originWidth":1014,"originHeight":479,"style":"widthContent"}_##]