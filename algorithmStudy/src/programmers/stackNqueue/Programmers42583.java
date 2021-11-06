package programmers.stackNqueue;

import java.util.LinkedList;
import java.util.Queue;

public class Programmers42583 {
    public static void main(String[] args) {
        int bridge_length = 2;
        int[] truck_weights = {7,4,5,6};
        int weight = 10;

        Queue<Integer> waitingTruck = new LinkedList<>(); //트럭 대기열
        Queue<Integer> currentBridge = new LinkedList<>(); //현재 다리 위

        //초기 다리 상태 세팅
        for(int i=0; i<bridge_length; i++) {
            currentBridge.add(0);
        }

        //대기 트럭 상태 세팅
        for(int truckWeight : truck_weights) {
            waitingTruck.add(truckWeight);
        }

        int time = 0; // 경과 시간
        int bridgeWeight = 0; //현재 다리 위 트럭 무게
        while(!currentBridge.isEmpty()) {
            if(waitingTruck.peek() == null) {
                time += bridge_length;
                break;
            }
            time++;
            bridgeWeight -= currentBridge.remove();

            if(bridgeWeight + waitingTruck.element() <= weight) {
                int truck = waitingTruck.remove();
                currentBridge.add(truck);
                bridgeWeight += truck;
            } else {
                currentBridge.add(0);
            }
        }

        System.out.println(time);
    }
}
