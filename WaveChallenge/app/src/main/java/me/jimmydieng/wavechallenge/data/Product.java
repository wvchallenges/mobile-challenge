package me.jimmydieng.wavechallenge.data;


import java.text.DecimalFormat;

public class Product {
  private String name;
  private double price;

  public Product(String name, double price) {
    this.name = name;
    this.price = price;
  }

  public String getName() {
    return name;
  }

  public String getPriceFormatted() {
    DecimalFormat decim = new DecimalFormat("0.00");
    return decim.format(price);
  }
}
