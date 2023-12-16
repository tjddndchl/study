package class1;

public class classStart5 {
    public static void main(String[] args) {

        Student student1 = new Student();
        student1.name = "학생1";
        student1.age = 15;
        student1.grade = 90;


        Student student2 = new Student();
        student2.name = "학생2";
        student2.age = 16;
        student2.grade = 80;

        Student student3 = new Student();
        student3.name = "학생3";
        student3.age = 17;
        student3.grade = 70;



        Student[] students = new Student[]{student1, student2}; //배열 개수도 정해줘야됨
        //자바에서 대입은 항상 변수에 들어 있는 값을 복사해서 전달한다..
        //변수들에는 인스턴스의 위치를 가리키는 참조값이 들어있다.
        for (int i = 0; i < students.length; i++) {
            System.out.println("이름:" + students[i].name + "나이:" + students[i].age + "성적:" +students[i].grade);
        }

        //for문 최적화
        for (int i = 0; i < students.length; i++) {
            Student s = students[i];
            System.out.println("이름:" + s.name + "나이:" + s.age + "성적:" + s.grade);
        }

        //향상된 포문 : iter
        for (Student s : students){
            System.out.println("이름:" + s.name + "나이:" + s.age + "성적:" + s.grade);
        }




    }
}
