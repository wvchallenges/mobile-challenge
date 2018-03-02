package com.dhamu.waveproject.model;

import java.util.ArrayList;

/**
 * Created by dhame on 3/2/2018.
 */

public class Product {

    int id, price;
    String url, name, description, expense_account, date_created, date_modified;
    boolean is_sold, is_bought, active;
    IncomeAccount income_account;
    ArrayList<DefaultSalesTaxes> default_sales_taxes;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getExpense_account() {
        return expense_account;
    }

    public void setExpense_account(String expense_account) {
        this.expense_account = expense_account;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    public String getDate_modified() {
        return date_modified;
    }

    public void setDate_modified(String date_modified) {
        this.date_modified = date_modified;
    }

    public boolean isIs_sold() {
        return is_sold;
    }

    public void setIs_sold(boolean is_sold) {
        this.is_sold = is_sold;
    }

    public boolean isIs_bought() {
        return is_bought;
    }

    public void setIs_bought(boolean is_bought) {
        this.is_bought = is_bought;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public IncomeAccount getIncome_account() {
        return income_account;
    }

    public void setIncome_account(IncomeAccount income_account) {
        this.income_account = income_account;
    }

    public ArrayList<DefaultSalesTaxes> getDefault_sales_taxes() {
        return default_sales_taxes;
    }

    public void setDefault_sales_taxes(ArrayList<DefaultSalesTaxes> default_sales_taxes) {
        this.default_sales_taxes = default_sales_taxes;
    }

    public class IncomeAccount {
        long id;
        String url;

        public long getId() {
            return id;
        }

        public void setId(long id) {
            this.id = id;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }
    }

    public class DefaultSalesTaxes {}

}
