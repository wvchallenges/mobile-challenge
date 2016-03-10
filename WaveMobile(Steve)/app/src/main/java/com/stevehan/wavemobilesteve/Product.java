package com.stevehan.wavemobilesteve;

/**
 * Created by schan on 16-03-10.
 */
public class Product {
    private String mName;
    private String mFormattedPrice;
    private double mPrice;

    public Product(String name, double price) {
        this.mName = name;
        this.mPrice = price;
        setFormattedPrice();
    }

    public String getName() {
        return mName;
    }

    public void setName(String name) {
        this.mName = name;
    }

    public double getPrice() {
        return mPrice;
    }

    public void setPrice(double price) {
        this.mPrice = price;
        setFormattedPrice();
    }

    public String getFormattedPrice() {
        return mFormattedPrice;
    }

    public void setFormattedPrice() {
        mFormattedPrice = String.format("$%.2f", mPrice);
    }
}
