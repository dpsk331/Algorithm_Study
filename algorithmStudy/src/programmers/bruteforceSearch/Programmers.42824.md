프로그래머스 : [코딩테스트 연습 - 카펫](https://programmers.co.kr/learn/courses/30/lessons/42842)

---

#### **문제 설명**

Leo는 카펫을 사러 갔다가 아래 그림과 같이 중앙에는 노란색으로 칠해져 있고 테두리 1줄은 갈색으로 칠해져 있는 격자 모양 카펫을 봤습니다.

[##_Image|kage@NSEtZ/btrkw4iYQu7/oWKkSrbKa1y5y1fVAik0Tk/img.png|CDM|1.3|{"originWidth":843,"originHeight":636,"style":"alignCenter","width":626,"height":472}_##]

Leo는 집으로 돌아와서 아까 본 카펫의 노란색과 갈색으로 색칠된 격자의 개수는 기억했지만, 전체 카펫의 크기는 기억하지 못했습니다.

Leo가 본 카펫에서 갈색 격자의 수 brown, 노란색 격자의 수 yellow가 매개변수로 주어질 때 카펫의 가로, 세로 크기를 순서대로 배열에 담아 return 하도록 solution 함수를 작성해주세요.

**제한사항**

-   갈색 격자의 수 brown은 8 이상 5,000 이하인 자연수입니다.
-   노란색 격자의 수 yellow는 1 이상 2,000,000 이하인 자연수입니다.
-   카펫의 가로 길이는 세로 길이와 같거나, 세로 길이보다 깁니다.

**입출력 예**

| **brown** | **yellow** | **return** |
| --- | --- | --- |
| 10 | 2 | \[4, 3\] |
| 8 | 1 | \[3, 3\] |
| 24 | 24 | \[8, 6\] |

#### **나의 풀이**

```
class Solution {
    public int[] solution(int brown, int yellow) {
        int[] answer = new int[2];
        
        int sum = brown + yellow;
        for(int i=1; i<sum; i++) {
            if(sum%i == 0) {
                int j = sum/i;
                if(yellow == (i-2)*(j-2)) {
                    answer[0] = j;
                    answer[1] = i;
                    break;
                }
            }
        }
        
        return answer;
    }
}
```

#### **오늘의 노력 🤦‍♀️**

-   yellow는 brown의 가로, 세로를 4개의 모서리를 제외한 (가로-2)\*(세로-2)의 크기이다.

#### **오늘의 배움 📚**

-   **약수**는 %가 0인 값이다.

#### **실행 결과**

[##_Image|kage@dUvHTx/btrkBumYdqH/y8ur8nZAkfEFfLPhRYl540/img.png|CDM|1.3|{"originWidth":650,"originHeight":531,"style":"alignCenter"}_##]