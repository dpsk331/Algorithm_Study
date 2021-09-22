package level16_greedyAlgorithm;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Comparator;
import java.util.StringTokenizer;

//백문 1931번 문제] 회의실 배정
public class Baekjoon1931 {
    public static void main(String[] args) throws IOException {
        //입력 시작
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine()); //회의 수
        int arr[][] = new int[n][2];

        for(int i=0; i<n; i++) {
            st = new StringTokenizer(br.readLine());
            arr[i][0] = Integer.parseInt(st.nextToken());
            arr[i][1] = Integer.parseInt(st.nextToken());
        }
        //입력 끝

        //회의가 끝나는 시간 기준으로 오름차순 정렬
        Arrays.sort(arr, (o1, o2) -> {
                // 종료 시간이 같을 경우 시작 시간이 빠른순으로 정렬
                if(o1[1] == o2[1]) {
                    return o1[0] - o2[0];
                } else{
                    return o1[1] - o2[1];
                }
        });

        int count = 0; //하루 최대 회의 수
        int endTime = 0;
        for(int i=-0; i<n; i++) {
            if(endTime <= arr[i][0]) {
                endTime = arr[i][1];
                count++;
            }
        }

        System.out.println(count);
    }
}
