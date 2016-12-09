package com.waveapps.ehanjin.codechallenge.model;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by SJ on 12/7/16.
 */

public class ProductHolder {

    private HashMap<Long, Account> accountList = new HashMap<>();
    private ArrayList<Product> productList = new ArrayList<>();

    public ProductHolder() {
    }

    public ArrayList<Product> getProductList() {
        return productList;
    }

    public void setProductList(ArrayList<Product> productList) {
        this.productList = productList;
    }

    public HashMap<Long, Account> getAccountList() {
        return accountList;
    }

    public void setAccountList(HashMap<Long, Account> accountList) {
        this.accountList = accountList;
    }

    public Account getAccount(long id) {
        return accountList.get(new Long(id));
    }

    public void addAccount(Account account) {
        accountList.put(new Long(account.getId()), account);
    }

    public void addProduct(Product product) {
        productList.add(product);
    }
}
