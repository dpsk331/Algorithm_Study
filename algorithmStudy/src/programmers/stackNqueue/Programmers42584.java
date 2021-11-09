package programmers.stackNqueue;

public class Programmers42584 {
    public static void main(String[] args) {
        int[] prices = {1, 2, 3, 2, 3};
        int len = prices.length;
        int[] answer = new int[len];

        for(int i=0; i<len; i++) {
            int increasing = 0;
            int price = prices[i];
            for(int j=i; j<len; j++) {
                if(price <= prices[j]) {
                    answer[i] = increasing;
                } else {
                    answer[i] = increasing;
                    break;
                }
                increasing++;
            }
        }

        for(int i : answer) System.out.println(i);
    }
}
