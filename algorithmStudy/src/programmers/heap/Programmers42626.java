package programmers.heap;

import java.util.PriorityQueue;

public class Programmers42626 {

    public static void main(String[] args) {
        int[] scoville = {1, 2, 3, 9, 10, 12};
        int K = 7;
        int answer = 0;

        PriorityQueue<Integer> heap = new PriorityQueue<>();

        for(int i : scoville) {
            heap.add(i);
        }

        int count = 0;
        while(!heap.isEmpty()) {
            //모든 요소가 K 이상일 경우
            if(heap.peek() >= K) {
                break;
            } else if(heap.size() == 1) {
                count = -1;
                break;
            }

            int newScoville = heap.poll() + (heap.poll() * 2);

            heap.add(newScoville);
            count++;
        }
        answer = count;

        System.out.println(answer);
    }
}