프로그래머스 : [코딩테스트 연습 - 가장 먼 노드](https://programmers.co.kr/learn/courses/30/lessons/49189)

---

#### **문제 설명**

n개의 노드가 있는 그래프가 있습니다. 각 노드는 1부터 n까지 번호가 적혀있습니다. 1번 노드에서 가장 멀리 떨어진 노드의 갯수를 구하려고 합니다. 가장 멀리 떨어진 노드란 최단경로로 이동했을 때 간선의 개수가 가장 많은 노드들을 의미합니다.

노드의 개수 n, 간선에 대한 정보가 담긴 2차원 배열 vertex가 매개변수로 주어질 때, 1번 노드로부터 가장 멀리 떨어진 노드가 몇 개인지를 return 하도록 solution 함수를 작성해주세요.

**제한사항**

-   노드의 개수 n은 2 이상 20,000 이하입니다.
-   간선은 **양방향**이며 총 1개 이상 50,000개 이하의 간선이 있습니다.
-   vertex 배열 각 행 \[a, b\]는 a번 노드와 b번 노드 사이에 간선이 있다는 의미입니다.

**입출력 예**

| **n** | **vertex** | **return** |
| --- | --- | --- |
| 6 | \[\[3, 6\], \[4, 3\], \[3, 2\], \[1, 3\], \[1, 2\], \[2, 4\], \[5, 2\]\] | 3 |

**입출력 예 설명**

예제의 그래프를 표현하면 아래 그림과 같고, 1번 노드에서 가장 멀리 떨어진 노드는 4,5,6번 노드입니다.

[##_Image|kage@BpUdJ/btrkJl5JC8f/FvYLk2u8GNQ5LLOJ75mYjk/img.png|CDM|1.3|{"originWidth":466,"originHeight":432,"style":"alignCenter"}_##]

#### **나의 풀이**

```
import java.util.*;

class Solution {
    public static ArrayList<ArrayList<Integer>> graph = new ArrayList<>();
    public static boolean[] check; //방문 노드인지 체크하는 배열
    public static int[] count; //노드 1에서의 최대 거리 저장 배열
    
    public int solution(int n, int[][] edge) {
        int answer = 0;
        check = new boolean[n+1]; //노드의 표현에 대한 편리함을 위해 +1
        count = new int[n+1];
        
        for(int i=0; i<=n; i++) { //0 ~ n
            graph.add(i, new ArrayList<>());
        }
        
        //양방향으로 노드의 연결 추가해주기
        for(int i=0; i<edge.length; i++) { // 노드의 개수와 간선의 개수가 다름 i<n이 아닌 edge.length로 해야 함
            graph.get(edge[i][0]).add(edge[i][1]);
            graph.get(edge[i][1]).add(edge[i][0]);
        }
        
        answer = bfs();                       
        return answer;
    }
                                             
    public static int bfs() {
        Queue<Integer> queue = new LinkedList<>();
        queue.add(1);
        check[1] = true;
        count[1] = 1;
        
        while(!queue.isEmpty()) {
            int cur = queue.remove();
            // System.out.print("cur: " + cur);
            
            for(int val : graph.get(cur)) { //각 노드마다 연결된 노드를 체크
                // System.out.print("val: " + val);
                if(!check[val]) {
                    check[val] = true;
                    count[val] = count[cur] + 1;
                    queue.add(val);
                } 
             }
            // System.out.println();
        }
        
        int result = 0;
        int max = Arrays.stream(count).max().getAsInt();
        for(int val : count) {
            // System.out.println(val);
            if(max == val) result++;
        }
            
        return result;
    }
}
```

#### **오늘의 노력 🤦‍♀️**

-   현재 문제 바로 전에 풀었던 문제가 **DFS > 네트워크**라서 2차원 배열로 선언해서 연결을 체크해서 할까 했는데, 현재 문제는 노드의 최대값이 20,000 이기 때문에 2차원 배열로 선언할 경우 4억... 한 번 돌 때 무조건 1초 이상이라서 너무 오래서 걸려서 패스
    -   그래서 **ArrayList<ArrayList<Integer>>** 이차원 가변 배열 사용

```
	// 2차원 배열로 표현한 graph에 연결된 노드인 경우 true로 표시
        for(int i=0; i<n; i++) {
            int[] arr = edge[0][i];
            int x = arr[0];
            int y = arr[1];
            graph[x][y] = true;
            graph[y][x] = true;
        }
```

-   또한, **bfs**를 사용해서 문제 해결

[\[프로그래머스\] 가장 먼 노드 (java)

🔗 문제링크 https://programmers.co.kr/learn/courses/30/lessons/49189 👩🏻‍💻 코드 (dfs - 시간초과) 👩🏻‍💻 코드 (bfs - 통과) 📝 정리 처음에 dfs로 풀었는데 시간 초과가 나버렸다. 아무래

velog.io](https://velog.io/@hammii/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EA%B0%80%EC%9E%A5-%EB%A8%BC-%EB%85%B8%EB%93%9C-java)

-   그래프 문제는 반복문을 돌릴 때 **노드의 개수**와 **간선의 개수**를 잘 생각해서 돌려야 함.. 😭

#### **오늘의 배움 📚**

-   **이차원 가변 길이 배열**

[Java 인접행렬과 인접리스트를 이용하여 그래프 구현하기

Java 인접행렬과 인접리스트를 이용하여 그래프 구현하기 Java로 인접행렬과 인접리스트를 만들어 그래프를 구현하는 방법에 대해 알아보겠습니다. 1. 그래프 (Graph) 수학적 정의로 그래프는 객

freestrokes.tistory.com](https://freestrokes.tistory.com/87)

[ArrayList 안에 ArrayList ≒ 2차원배열

ArrayList 로 생성한 인스턴스는 1차원 배열이라고 생각하게 된다. 그렇다면 ArrayList로 2차원 배열은 어떻게 생성이 되는지 궁금하게 됐다. 그래서 제네릭 T 안에 ArrayList 를 또 집어넣는 것이다.  코

c-king.tistory.com](https://c-king.tistory.com/87)

-   **BFS**

[15\. 너비 우선 탐색(BFS)

너비 우선 탐색(Breadth First Search, BFS)은 탐색을 할 때 너비를 우선으로 하여 탐색을 수행하는 ...

blog.naver.com](https://m.blog.naver.com/PostView.naver?blogId=ndb796&logNo=221230944971&proxyReferer=)

[\[알고리즘\] 깊이 우선 탐색(DFS) 과 너비 우선 탐색(BFS)

\[알고리즘\] 깊이 우선 탐색(DFS)과 너비 우선 탐색(BFS) 그래프를 탐색하는 방법에는 크게 깊이 우선 탐색(DFS)과 너비 우선 탐색(BFS)이 있습니다. 📌여기서 그래프란, 정점(node)과 그 정점을 연

devuna.tistory.com](https://devuna.tistory.com/32)

-   **자바 배열의 최대값 최소값 구하는 방법 3가지**

[자바 배열 최대값 최소값 구하는 방법

자바에서 배열의 최대값 최소값을 구하는 방법은 for 문을 이용하는 방법, Array.sort(배열명) 을 이용하는 방법 Stream을 이용하는 방법 3가지가 있는데 차례대로 알아보자 먼저 for 문을 이용하는 방

wakestand.tistory.com](https://wakestand.tistory.com/423)

#### **실행 결과**

[##_Image|kage@c5L13i/btrkOj7o2Gj/fVGLOa8fHgAXYPnySFywA1/img.png|CDM|1.3|{"originWidth":569,"originHeight":387,"style":"alignLeft"}_##]