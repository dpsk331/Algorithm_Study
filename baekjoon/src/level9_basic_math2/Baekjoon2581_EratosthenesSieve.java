package level9_basic_math2;

import java.io.IOException;
import java.util.Scanner;

// 백준 2581 문제] 소수
// 자연수 M과 N이 주어질 때 M 이상 N 이하의 자연수 중 소수인 것을 모두 골라 이들 소수의 합과 최솟값을 찾는 프로그램
public class Baekjoon2581_EratosthenesSieve {
    public static void eratosthenes() {
        eratosArr[0] = true;
        eratosArr[1] = true;

        for(int i = 2; i <= Math.sqrt(eratosArr.length); i++) { // 구하려는 크기의 루트 값까지만 계산해도 모두 체크 가능!
            for(int j = i * i; j < eratosArr.length; j += i) {
                eratosArr[j] = true;
            }
        }
    }

    public static boolean eratosArr[];

    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        int start = sc.nextInt(); // m부터
        int last = sc.nextInt(); // n까지

        eratosArr = new boolean[last+1];
        eratosthenes();

        int sum = 0;
        int min = Integer.MAX_VALUE;

        for(int i=start; i<=last; i++) {
            if(eratosArr[i] == false) { // false == 소수
                sum += i;
                if(min == Integer.MAX_VALUE) { // 첫 번쨰 소수가 최솟값
                    min = i;
                }
            }
        }

        if(sum == 0) {
            System.out.println(-1);
        } else {
            System.out.println(sum);
            System.out.println(min);
        }

    } //main end
}
