package baekjoon;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

//백준 3036번 문제 > 링
public class Backjoon3036 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int N = Integer.parseInt(br.readLine());
        int[] arr = new int[N];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<N; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        int startRing = arr[0];
        for(int i=1; i<N; i++) {
            int gcd = GCD(startRing, arr[i]);
            System.out.println(startRing/gcd + "/" + arr[i]/gcd);
        }
    }

    public static int GCD(int a, int b){ //최대 공약수
        if (a % b == 0) {
            return b;
        }
        return GCD(b, a % b);
    }
}
