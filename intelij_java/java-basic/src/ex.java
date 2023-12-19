import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ex {
    public int[] solution(int n, int[] slicer, int[] num_list) {
        List<Integer> tempList = new ArrayList<>();

        int[] answer = new int[tempList.size()];

        if(n ==1){
            for (int i = 0; i <= slicer[1]; i++) {
                tempList.add(num_list[i]);
            }
        }else if (n == 2){
            for (int i = slicer[0]; i < slicer.length; i++) {
                tempList.add(num_list[i]);
            }
        }else if (n == 3){
            for (int i = slicer[0]; i <= slicer[1] ; i++) {
                tempList.add(num_list[i]);
            }
        }else if (n == 4){
            for (int i = slicer[0]; i <= slicer[1] ; i+= slicer[2]) {
                tempList.add(num_list[i]);
            }
        }

        for (int i = 0; i < tempList.size(); i++) {
            answer[i] = tempList.get(i);
        }


        return answer;
    }


}
