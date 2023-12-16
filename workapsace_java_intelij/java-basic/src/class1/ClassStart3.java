package class1;

public class ClassStart3 {
    /*
    * 클래스를 통해 사용자가 원하는 종류의 타입을 마음대로 만들수 있다.
    * 클래스를 통해 설계도를 기반으로 실제만들어진 실체를 객체 또는 인스턴스
    * */
    public static void main(String[] args) {
        Student student1;
        student1 = new Student(); // 클래스 정보를 기반으로 새로운 객체를 생성하라 x001

        student1.name = "학생1";
        student1.age = 15;
        student1.grade = 90;

        Student student2 = new Student(); // x002
        student2.name = "학생2";
        student2.age = 16;
        student2.grade = 80;

        System.out.println(student1);
        System.out.println(student2);

        System.out.println("이름:" + student1.name + "나이:" + student1.age + "성적:" + student1.grade);
        System.out.println("이름:" + student2.name + "나이:" + student2.age + "성적:" + student2.grade);

    }
}
