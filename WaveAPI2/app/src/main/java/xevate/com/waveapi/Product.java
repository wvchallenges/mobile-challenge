package xevate.com.waveapi;


public class Product {

    public String Prod_name;
    public double Prod_price;


    public void setProd(String name, double price) {
        this.Prod_name = name;
        this.Prod_price = price;
    }

    public String getName() {
        return Prod_name;
    }

    public double getPrice() {
        return Prod_price;
    }


}