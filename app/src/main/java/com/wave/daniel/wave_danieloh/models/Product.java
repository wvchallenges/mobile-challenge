package com.wave.daniel.wave_danieloh.models;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by Daniel on 2016-11-12.
 */
public class Product implements Parcelable {

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

    protected Product(Parcel in) {
        id = in.readLong();
        url = in.readString();
        name = in.readString();
        price = in.readDouble();
        description = in.readString();
        is_sold = in.readByte() != 0;
        is_bought = in.readByte() != 0;
        income_account = in.readParcelable(IncomeAccount.class.getClassLoader());
        expense_account = in.readString();
        active = in.readByte() != 0;
        date_created = in.readString();
        date_modified = in.readString();
    }

    public static final Creator<Product> CREATOR = new Creator<Product>() {
        @Override
        public Product createFromParcel(Parcel in) {
            return new Product(in);
        }

        @Override
        public Product[] newArray(int size) {
            return new Product[size];
        }
    };

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

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(id);
        parcel.writeString(url);
        parcel.writeString(name);
        parcel.writeDouble(price);
        parcel.writeString(description);
        parcel.writeByte((byte) (is_sold ? 1 : 0));
        parcel.writeByte((byte) (is_bought ? 1 : 0));
        parcel.writeParcelable(income_account, i);
        parcel.writeString(expense_account);
        parcel.writeByte((byte) (active ? 1 : 0));
        parcel.writeString(date_created);
        parcel.writeString(date_modified);
    }
}
