package com.example.justinkrinke.wavechallenge.models;


import com.google.gson.annotations.Expose;

import java.math.BigDecimal;

/**
 * Product model that gets populated from GSON
 */


import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Products {

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
    private BigDecimal price;
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
    private List<Object> defaultSalesTaxes = new ArrayList<>();

    /**
     *
     * @return
     *     The id
     */
    public Integer getId() {
        return id;
    }

    /**
     *
     * @param id
     *     The id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     *
     * @return
     *     The url
     */
    public String getUrl() {
        return url;
    }

    /**
     *
     * @param url
     *     The url
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     *
     * @return
     *     The name
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param name
     *     The name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return
     *     The price
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     *
     * @param price
     *     The price
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     *
     * @return
     *     The description
     */
    public String getDescription() {
        return description;
    }

    /**
     *
     * @param description
     *     The description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     *
     * @return
     *     The isSold
     */
    public Boolean getIsSold() {
        return isSold;
    }

    /**
     *
     * @param isSold
     *     The is_sold
     */
    public void setIsSold(Boolean isSold) {
        this.isSold = isSold;
    }

    /**
     *
     * @return
     *     The isBought
     */
    public Boolean getIsBought() {
        return isBought;
    }

    /**
     *
     * @param isBought
     *     The is_bought
     */
    public void setIsBought(Boolean isBought) {
        this.isBought = isBought;
    }

    /**
     *
     * @return
     *     The incomeAccount
     */
    public IncomeAccount getIncomeAccount() {
        return incomeAccount;
    }

    /**
     *
     * @param incomeAccount
     *     The income_account
     */
    public void setIncomeAccount(IncomeAccount incomeAccount) {
        this.incomeAccount = incomeAccount;
    }

    /**
     *
     * @return
     *     The expenseAccount
     */
    public Object getExpenseAccount() {
        return expenseAccount;
    }

    /**
     *
     * @param expenseAccount
     *     The expense_account
     */
    public void setExpenseAccount(Object expenseAccount) {
        this.expenseAccount = expenseAccount;
    }

    /**
     *
     * @return
     *     The active
     */
    public Boolean getActive() {
        return active;
    }

    /**
     *
     * @param active
     *     The active
     */
    public void setActive(Boolean active) {
        this.active = active;
    }

    /**
     *
     * @return
     *     The dateCreated
     */
    public String getDateCreated() {
        return dateCreated;
    }

    /**
     *
     * @param dateCreated
     *     The date_created
     */
    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    /**
     *
     * @return
     *     The dateModified
     */
    public String getDateModified() {
        return dateModified;
    }

    /**
     *
     * @param dateModified
     *     The date_modified
     */
    public void setDateModified(String dateModified) {
        this.dateModified = dateModified;
    }

    /**
     *
     * @return
     *     The defaultSalesTaxes
     */
    public List<Object> getDefaultSalesTaxes() {
        return defaultSalesTaxes;
    }

    /**
     *
     * @param defaultSalesTaxes
     *     The default_sales_taxes
     */
    public void setDefaultSalesTaxes(List<Object> defaultSalesTaxes) {
        this.defaultSalesTaxes = defaultSalesTaxes;
    }

}
