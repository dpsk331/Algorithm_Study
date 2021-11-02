package baekjoon.level17_numberTheoryAndombinatorics;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

//백준 9375번 문제 > 패션왕 신혜빈
public class Backjoon9375 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int N = Integer.parseInt(br.readLine());
        for(int i=0; i<N; i++) {
            int kinds = Integer.parseInt(br.readLine());
            Map<String, Integer> map = new HashMap<>();

            for(int j=0; j<kinds; j++) {
                st = new StringTokenizer(br.readLine());
                String value = st.nextToken();
                String key = st.nextToken();
                map.put(key, map.getOrDefault(key, 0) +1);
            }

            int result = 1;
            for(String key : map.keySet()) {
                result *= (map.get(key) + 1);
            }

            System.out.println(result-1);
        }
    }
}
