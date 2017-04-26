package com.eslimaf.mobilechallenge.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.List;

public class Product implements Parcelable
{

    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("url")
    @Expose
    private String url;
    @SerializedName("name")
    @Expose
    private String name;
    @SerializedName("price")
    @Expose
    private Integer price;
    @SerializedName("description")
    @Expose
    private String description;
    @SerializedName("is_sold")
    @Expose
    private Boolean isSold;
    @SerializedName("is_bought")
    @Expose
    private Boolean isBought;
    @SerializedName("income_account")
    @Expose
    private IncomeAccount incomeAccount;
    @SerializedName("expense_account")
    @Expose
    private Object expenseAccount;
    @SerializedName("active")
    @Expose
    private Boolean active;
    @SerializedName("date_created")
    @Expose
    private String dateCreated;
    @SerializedName("date_modified")
    @Expose
    private String dateModified;
    @SerializedName("default_sales_taxes")
    @Expose
    private List<Object> defaultSalesTaxes = null;
    public final static Parcelable.Creator<Product> CREATOR = new Creator<Product>() {


        @SuppressWarnings({
                "unchecked"
        })
        public Product createFromParcel(Parcel in) {
            Product instance = new Product();
            instance.id = ((Integer) in.readValue((Integer.class.getClassLoader())));
            instance.url = ((String) in.readValue((String.class.getClassLoader())));
            instance.name = ((String) in.readValue((String.class.getClassLoader())));
            instance.price = ((Integer) in.readValue((Integer.class.getClassLoader())));
            instance.description = ((String) in.readValue((String.class.getClassLoader())));
            instance.isSold = ((Boolean) in.readValue((Boolean.class.getClassLoader())));
            instance.isBought = ((Boolean) in.readValue((Boolean.class.getClassLoader())));
            instance.incomeAccount = ((IncomeAccount) in.readValue((IncomeAccount.class.getClassLoader())));
            instance.expenseAccount = ((Object) in.readValue((Object.class.getClassLoader())));
            instance.active = ((Boolean) in.readValue((Boolean.class.getClassLoader())));
            instance.dateCreated = ((String) in.readValue((String.class.getClassLoader())));
            instance.dateModified = ((String) in.readValue((String.class.getClassLoader())));
            in.readList(instance.defaultSalesTaxes, (java.lang.Object.class.getClassLoader()));
            return instance;
        }

        public Product[] newArray(int size) {
            return (new Product[size]);
        }

    }
            ;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getIsSold() {
        return isSold;
    }

    public void setIsSold(Boolean isSold) {
        this.isSold = isSold;
    }

    public Boolean getIsBought() {
        return isBought;
    }

    public void setIsBought(Boolean isBought) {
        this.isBought = isBought;
    }

    public IncomeAccount getIncomeAccount() {
        return incomeAccount;
    }

    public void setIncomeAccount(IncomeAccount incomeAccount) {
        this.incomeAccount = incomeAccount;
    }

    public Object getExpenseAccount() {
        return expenseAccount;
    }

    public void setExpenseAccount(Object expenseAccount) {
        this.expenseAccount = expenseAccount;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getDateModified() {
        return dateModified;
    }

    public void setDateModified(String dateModified) {
        this.dateModified = dateModified;
    }

    public List<Object> getDefaultSalesTaxes() {
        return defaultSalesTaxes;
    }

    public void setDefaultSalesTaxes(List<Object> defaultSalesTaxes) {
        this.defaultSalesTaxes = defaultSalesTaxes;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeValue(id);
        dest.writeValue(url);
        dest.writeValue(name);
        dest.writeValue(price);
        dest.writeValue(description);
        dest.writeValue(isSold);
        dest.writeValue(isBought);
        dest.writeValue(incomeAccount);
        dest.writeValue(expenseAccount);
        dest.writeValue(active);
        dest.writeValue(dateCreated);
        dest.writeValue(dateModified);
        dest.writeList(defaultSalesTaxes);
    }

    public int describeContents() {
        return 0;
    }

}
