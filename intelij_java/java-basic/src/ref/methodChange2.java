package ref;
<<<<<<< HEAD


=======
>>>>>>> 3776ffa931c094785f19afc179f4794fef499413

public class methodChange2 {
    public static void main(String[] args) {
        Data dataA = new Data();
        dataA.value = 10;

        System.out.println("메서드 호출 전 dataA.value = " + dataA.value);

        changeReference(dataA);

        System.out.println("메서드 호출 후 dataA.value = " + dataA.value);




    }

    static void changeReference(Data dataX) {

        dataX.value = 20;
    }

}
