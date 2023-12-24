package construct;

public class ContstructMain1 {
    public static void main(String[] args) {
        //생성자는 안들어가있으면 바로 컴파일 오류남
        MemberConstruct member1 = new MemberConstruct("user1", 15, 90);
        MemberConstruct member2 = new MemberConstruct("user2", 16, 80);

        MemberConstruct[] members = {member1, member2};
        for (MemberConstruct s : members) {
            System.out.println("이름 =" +s.name + "나이=" +s.age +"성적 =" + s.grade);
        }
    }
}
