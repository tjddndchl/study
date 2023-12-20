package pack;
//이미 임포트 했기 때문에 b 는 다적어주어야함
import pack.a.User;

public class PackageMain3 {
    public static void main(String[] args) {
        User user = new pack.a.User();
        User userA = new pack.a.User();
        User userB = new pack.a.User();
        User userC = new pack.a.User();
        pack.b.User userD = new pack.b.User();

    }
}
