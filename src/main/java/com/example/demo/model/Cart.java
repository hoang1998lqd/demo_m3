package com.example.demo.model;

import java.util.ArrayList;
import java.util.Objects;

public class Cart {
    private ArrayList<Item> items;
    public Cart(){
        items = new ArrayList<>();
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }

    // Trả ra số lượng của sản phẩm trong giỏ hàng
    public int getQuantityById(int id){
        return Objects.requireNonNull(getItemById(id)).getQuantity();
        // Tránh null để trả ra quantity
    }

    // Trả sản phẩm ở trong giỏ hàng
    private Item getItemById(int id){
        for (Item item : items){
            if (item.getProduct().getId() == id){
                return item;
            }
        }
        return null;
    }


    // Thêm vào giỏ hàng
    public void addItem(Item item){
        if (getItemById(item.getProduct().getId()) != null){
            // Tìm ra sản phẩm đã có trong giỏ hàng
            Item itemNew = getItemById(item.getProduct().getId());
            // Tăng số lượng sản phẩm lên mà k thêm sản phẩm cũ vào
            itemNew.setQuantity(itemNew.getQuantity() + item.getQuantity());
        }else {
            items.add(item);
        }
    }

    // Xóa sản phẩm trong giỏ hàng
    public void removeItem(int id){
        if (getItemById(id) != null){
            items.remove(getItemById(id));
        }
    }

    // Tính tổng tiền của giỏ hàng
    public int getTotalMoney(){
        int price = 0;
        for (Item item : items){
            price += item.getQuantity() * (item.getProduct().getPrice()-
                    item.getProduct().getPrice() * item.getProduct().getDiscount()/100);
        }
        return price;
    }




}
