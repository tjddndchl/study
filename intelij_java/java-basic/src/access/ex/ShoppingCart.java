package access.ex;

public class ShoppingCart {
    private Item[] items = new Item[10];
    private int itemCount;

    public void addItem(Item item){
        if (itemCount >- items.length){
            System.out.println("장바구니가 가득 찼다.");
            return;
        }

        items[itemCount] = item;
        itemCount++;
    }


}
