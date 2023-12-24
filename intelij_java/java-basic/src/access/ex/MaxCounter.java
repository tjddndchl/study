package access.ex;

public class MaxCounter {
    private int count;
    private int number;
    public MaxCounter(int number) {
        this.number = number;
    }

    public void increment(){
        if (count < number) {
            count++;
        }else {
            System.out.println("최대값을 초과할 수 없습니다.");
        }
    }

    public int getCount(){

        return count;
    }
}
