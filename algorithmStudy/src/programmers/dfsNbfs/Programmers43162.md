프로그래머스 : [코딩테스트 연습 - 네트워크](https://programmers.co.kr/learn/courses/30/lessons/43162)

---

#### **문제 설명**

네트워크란 컴퓨터 상호 간에 정보를 교환할 수 있도록 연결된 형태를 의미합니다. 예를 들어, 컴퓨터 A와 컴퓨터 B가 직접적으로 연결되어있고, 컴퓨터 B와 컴퓨터 C가 직접적으로 연결되어 있을 때 컴퓨터 A와 컴퓨터 C도 간접적으로 연결되어 정보를 교환할 수 있습니다. 따라서 컴퓨터 A, B, C는 모두 같은 네트워크 상에 있다고 할 수 있습니다.

컴퓨터의 개수 n, 연결에 대한 정보가 담긴 2차원 배열 computers가 매개변수로 주어질 때, 네트워크의 개수를 return 하도록 solution 함수를 작성하시오.

**제한사항**

-   컴퓨터의 개수 n은 1 이상 200 이하인 자연수입니다.
-   각 컴퓨터는 0부터 n-1인 정수로 표현합니다.
-   i번 컴퓨터와 j번 컴퓨터가 연결되어 있으면 computers\[i\]\[j\]를 1로 표현합니다.
-   computer\[i\]\[i\]는 항상 1입니다.

**입출력** 예

| **n** | **computers** | **return** |
| --- | --- | --- |
| 3 | \[\[1, 1, 0\], \[1, 1, 0\], \[0, 0, 1\]\] | 2 |
| 3 | \[\[1, 1, 0\], \[1, 1, 1\], \[0, 1, 1\]\] | 1 |

**입출력 예 설명**

**예제 #1**  
아래와 같이 2개의 네트워크가 있습니다.

[##_Image|kage@bdAZwu/btrkJl5lGNp/kNjOgqnkWPeaVQmkeh5NR1/img.png|CDM|1.3|{"originWidth":714,"originHeight":622,"style":"alignCenter","width":401,"height":349}_##]

**예제 #2**  
아래와 같이 1개의 네트워크가 있습니다.

[##_Image|kage@crqf62/btrkIPyRknW/Lhh1XPf9L2FSyfwwkB1D8k/img.png|CDM|1.3|{"originWidth":732,"originHeight":592,"style":"alignCenter","width":384,"height":311}_##]

#### **나의 풀이**

```
class Solution {
    public int solution(int n, int[][] computers) {
        int count = 0;
        boolean[] flag = new boolean[n];
        
        for(int i=0; i<n; i++) {
            if(!flag[i]) {
                dfs(computers, i, flag);
                count++;
            }
        }
        
        return count;
    }
    
    void dfs(int[][] computers, int i, boolean[] flag) {
        flag[i] = true;
        
        for(int j=0; j<computers.length; j++) {
            if(i != j && computers[i][j] == 1 && flag[j] == false) {
                flag[j] = true;
                dfs(computers, j, flag);
            }
        } 
    }
}
```

1.  재귀를 돌면서 현재 컴퓨터에 연결된 다음 컴퓨터로 이동하면서 해당 위치를 flag 배열을 통해서 true로 변경
2.  한 번의 연결이 끝나고(해당 컴퓨터들의 위치는 모두 true 처리되고) 다음 연결로(아직 방문한 적 없는 false 위치에서 재시작) 이동할 때마다 count가 올라가기 때문에 모든 네트워크의  수를 파악할 수 있음

#### **오늘의 노력 🤦‍♀️**

[\[프로그래머스\] 네트워크 문제풀이 (Java)

\[프로그래머스\] 네트워크 문제풀이 (Java)

velog.io](https://velog.io/@ajufresh/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4-Java)

#### **오늘의 배움 📚**

[\[알고리즘\] 깊이 우선 탐색(DFS) 과 너비 우선 탐색(BFS)

\[알고리즘\] 깊이 우선 탐색(DFS)과 너비 우선 탐색(BFS) 그래프를 탐색하는 방법에는 크게 깊이 우선 탐색(DFS)과 너비 우선 탐색(BFS)이 있습니다. 📌여기서 그래프란, 정점(node)과 그 정점을 연

devuna.tistory.com](https://devuna.tistory.com/32)

#### **실행 결과**

[##_Image|kage@bNFy6r/btrkJ7eHS3u/xqWBv7ibs6oBmJeDm3wMk0/img.png|CDM|1.3|{"originWidth":676,"originHeight":482,"style":"alignLeft"}_##]