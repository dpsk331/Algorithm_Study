package programmers.graph;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

//가장 먼 노드
public class Programmers49189 {
    public static ArrayList<ArrayList<Integer>> graph = new ArrayList<>();
    public static boolean[] check; //방문 노드인지 체크하는 배열
    public static int[] count; //노드 1에서의 최대 거리 저장 배열

    public static void main(String[] args) {
        int n = 2;
        int[][] edge = {{1, 2}};

            check = new boolean[n+1]; //노드의 표현에 대한 편리함을 위해 +1
            count = new int[n+1];

            for(int i=0; i<=n; i++) { //0 ~ n
                graph.add(i, new ArrayList<>());
            }

            //양방향으로 노드의 연결 추가해주기
            for(int i=0; i<=n; i++) {
                graph.get(edge[i][0]).add(edge[i][1]);
                graph.get(edge[i][1]).add(edge[i][0]);
            }

            System.out.println(bfs());
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
