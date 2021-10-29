package baekjoon.level16_greedyAlgorithm;

import java.io.IOException;
import java.util.Scanner;

//백준 1541번 문제] 잃어버린 괄호
public class Baekjoon1541 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        String[] arr = sc.nextLine().split("-");

        int result = Integer.MAX_VALUE; //Integer.MAX_VALUE로 줘야 함!

        for(int i=0; i<arr.length; i++) {
            int temp = 0;

            //"-"으로 나뉜 토큰을 "+"로 나누거나 +가 포함되지 않을 경우 현재 값 그대로 가져옴
            String[] plusArr = arr[i].split("\\+");

            for(String s : plusArr) {
                temp += Integer.parseInt(s);
            }

            if(result == Integer.MAX_VALUE) { //첫번째 수가 들어오는 경우
                result = temp;
            } else {
                result -= temp;
            }
        }

        System.out.println(result);
    }
}
