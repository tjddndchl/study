package ref;

public class NullMain1 {
    public static void main(String[] args) {

        Data data = null; //참조할 대상이 없다
        System.out.println("1. data =" + data);
        data = new Data();
        System.out.println("2. data=" + data);
        data = null;
        System.out.println("3. data = " + data);
        /*
        * 아무도 참조하지 않는 인스턴스의 최후
        *해당 인스턴스에 다시 접근할 방법이 없다.
        * C와 같은 과거 프로그래밍 언어는개발자가 직접 명령어를 사용해서 인스턴스를 메모리에서 제거해야 했다.
        * 아무도 참조하지 않는 인스턴스가 있으면 JVM의 GC(가비지 컬렉션)이 더이상 사용하지 않는 인스턴스라 판단하고 해당 인스턴스를 자동으로 메모리에서 제거
        * */
    }
}
