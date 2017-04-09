package xevate.com.waveapi;

import java.util.ArrayList;

public class Global  {

    public ArrayList<Product> GlobProdList;
    private static Global instance;

    private Global(){
        GlobProdList = new ArrayList<Product>();
    }
    public static Global getInstance(){
        if (instance == null){ instance = new Global(); }
        return instance;
    }

    public ArrayList<Product> getProdArrayList() {
        return GlobProdList;
    }
    public void resetProdArrayList(){
        this.GlobProdList.clear();// = null;
    }

    public void add2ProdArrayList(Product obj) {
        this. GlobProdList.add(obj);
    }



}