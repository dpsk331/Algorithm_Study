package baekjoon.level24_dfs_bfs;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Backjoon1260 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int nodeNo = Integer.parseInt(br.readLine());
        int edgeNo = Integer.parseInt(br.readLine());
        int startNode = Integer.parseInt(br.readLine());
        int[][] arr = new int[nodeNo+1][nodeNo+1];

        for(int i=0; i<edgeNo; i++) {
            st = new StringTokenizer(br.readLine());

            int x = Integer.parseInt(st.nextToken());
            int y = Integer.parseInt(st.nextToken());

            arr[x][y] = 1;
            arr[y][x] = 1;
        }

        dfs(arr, startNode, nodeNo);
        bfs(arr, startNode, nodeNo);
    }

    public static void dfs(int[][] arr, int startNode, int nodeNo) {
        ArrayList<Integer> dfs = new ArrayList<>();
        boolean[] flag = new boolean[nodeNo];

        dfs.add(startNode);
        flag[startNode] = true;
        for(int i=0; i<=nodeNo; i++) {
            if(startNode != i && arr[startNode][i] == 1 && flag[i] == false) {
                flag[i] = true;
//                dfs(arr, i, )
            }
        }


    }

    public static void bfs(int[][] arr, int startNode, int nodeNo) {
        ArrayList<Integer> bfs = new ArrayList<>();
        boolean[] flag = new boolean[nodeNo];

    }
}
