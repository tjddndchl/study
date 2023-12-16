package class1;

public class classStart2 {
    public static void  main(String[] args){
        String[] studentNames = {"학생1", "학생2","학생3","학생4 "};
        int[] studentAge = {15, 16, 17, 20};
        int[] studentGrade = {90, 80, 70 ,60};


        for (int i=0; i < studentNames.length; i++){
            System.out.println("이름:" + studentNames[i] + "나이:" + studentAge[i] + "성적:" + studentGrade[i]);
        }


    //배열의 한계 데이터를 변경할때 매우 조심해서 작업해야함
    //학생데이터 하나 변경하는데 3개 를 다 변경해야됨


    }
}
