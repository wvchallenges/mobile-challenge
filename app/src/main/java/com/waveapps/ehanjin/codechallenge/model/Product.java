package com.waveapps.ehanjin.codechallenge.model;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by SJ on 12/7/16.
 */

public class Product implements Parcelable {

    private long id;
    private String url;
    private String name;
    private double price;
    private String description;
    private boolean isSold;
    private boolean isBought;
    private Account incomeAccount = null;
    private Account expenseAccount = null;
    private boolean active;
//    private List<Double> default_sales_taxes;
    private String dateCreated;
    private String dateModified;

    public Product() {
    }

    protected Product(Parcel in) {
        id = in.readLong();
        url = in.readString();
        name = in.readString();
        price = in.readDouble();
        description = in.readString();
        isSold = in.readByte() != 0;
        isBought = in.readByte() != 0;
        incomeAccount = in.readParcelable(Account.class.getClassLoader());
        expenseAccount = in.readParcelable(Account.class.getClassLoader());
        active = in.readByte() != 0;
        dateCreated = in.readString();
        dateModified = in.readString();
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
        parcel.writeByte((byte) (isSold ? 1 : 0));
        parcel.writeByte((byte) (isBought ? 1 : 0));
        parcel.writeParcelable(incomeAccount, i);
        parcel.writeParcelable(expenseAccount, i);
        parcel.writeByte((byte) (active ? 1 : 0));
        parcel.writeString(dateCreated);
        parcel.writeString(dateModified);
    }

    public long getId() {
        return id;
    }

    public String getUrl() {
        return url;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public boolean isSold() {
        return isSold;
    }

    public boolean isBought() {
        return isBought;
    }

    public Account getIncomeAccount() {
        return incomeAccount;
    }

    public Account getExpenseAccount() {
        return expenseAccount;
    }

    public boolean isActive() {
        return active;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public String getDateModified() {
        return dateModified;
    }

    public Product setId(long id) {
        this.id = id;
        return this;
    }

    public Product setUrl(String url) {
        this.url = url;
        return this;
    }

    public Product setName(String name) {
        this.name = name;
        return this;
    }

    public Product setPrice(double price) {
        this.price = price;
        return this;
    }

    public Product setDescription(String description) {
        this.description = description;
        return this;
    }

    public Product setSold(boolean sold) {
        isSold = sold;
        return this;
    }

    public Product setBought(boolean bought) {
        isBought = bought;
        return this;
    }

    public Product setIncomeAccount(Account incomeAccount) {
        this.incomeAccount = incomeAccount;
        return this;
    }

    public Product setExpenseAccount(Account expenseAccount) {
        this.expenseAccount = expenseAccount;
        return this;
    }

    public Product setActive(boolean active) {
        this.active = active;
        return this;
    }

    public Product setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
        return this;
    }

    public Product setDateModified(String dateModified) {
        this.dateModified = dateModified;
        return this;
    }
}
