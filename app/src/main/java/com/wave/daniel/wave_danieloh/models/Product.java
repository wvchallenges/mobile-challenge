package com.wave.daniel.wave_danieloh.models;

/**
 * Created by Daniel on 2016-11-12.
 */
public class Product {

    private long id;
    private String url;
    private String name;
    private double price;
    private String description;
    private boolean is_sold;
    private boolean is_bought;
    private IncomeAccount income_account;
    private String expense_account;
    private boolean active;
    private String date_created;
    private String date_modified;

    protected Product() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean is_sold() {
        return is_sold;
    }

    public void setIs_sold(boolean is_sold) {
        this.is_sold = is_sold;
    }

    public boolean is_bought() {
        return is_bought;
    }

    public void setIs_bought(boolean is_bought) {
        this.is_bought = is_bought;
    }

    public IncomeAccount getIncome_account() {
        return income_account;
    }

    public void setIncome_account(IncomeAccount income_account) {
        this.income_account = income_account;
    }

    public String getExpense_account() {
        return expense_account;
    }

    public void setExpense_account(String expense_account) {
        this.expense_account = expense_account;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
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
}
