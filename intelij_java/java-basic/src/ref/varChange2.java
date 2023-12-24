package ref;



public class varChange2 {
    public static void main(String[] args) {
        Data dataA = new Data();
        dataA.value = 10;
        Data dataB = dataA;

        System.out.println("dataA 의  참조값은" + dataA);
        System.out.println("dataB 의  참조값은" + dataB);

        System.out.println("dataA 의 value 는" + dataA.value);
        System.out.println("dataB 의 value 는" + dataB.value);

        //dataA의 값변경
        dataA.value = 20;
        System.out.println("변경된 dataA.value = 20");
        System.out.println(" dataA.value =" + dataA.value);
        System.out.println(" dataB.value =" + dataB.value);

        //dataB 의 값 변경
        dataB.value = 30;
        System.out.println("변경된 dataB.value = 20");
        System.out.println("dataA.value = " + dataA.value);
        System.out.println("dataB.value = " + dataB.value);
    }
}
