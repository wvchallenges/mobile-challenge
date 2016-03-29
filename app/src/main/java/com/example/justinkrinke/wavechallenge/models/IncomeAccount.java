package com.example.justinkrinke.wavechallenge.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * IncomeAccount for JSON
 */


public class IncomeAccount {

    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("url")
    @Expose
    private String url;
    @SerializedName("name")
    @Expose
    private String name;
    @SerializedName("active")
    @Expose
    private Boolean active;
    @SerializedName("account_template_id")
    @Expose
    private Integer accountTemplateId;
    @SerializedName("account_type")
    @Expose
    private String accountType;
    @SerializedName("system_account")
    @Expose
    private String systemAccount;
    @SerializedName("is_payment")
    @Expose
    private Boolean isPayment;
    @SerializedName("can_delete")
    @Expose
    private Boolean canDelete;
    @SerializedName("currency")
    @Expose
    private Currency currency;
    @SerializedName("is_currency_editable")
    @Expose
    private Boolean isCurrencyEditable;
    @SerializedName("is_name_editable")
    @Expose
    private Boolean isNameEditable;
    @SerializedName("is_payment_editable")
    @Expose
    private Boolean isPaymentEditable;
    @SerializedName("date_created")
    @Expose
    private String dateCreated;
    @SerializedName("date_modified")
    @Expose
    private String dateModified;

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
     *     The accountTemplateId
     */
    public Integer getAccountTemplateId() {
        return accountTemplateId;
    }

    /**
     *
     * @param accountTemplateId
     *     The account_template_id
     */
    public void setAccountTemplateId(Integer accountTemplateId) {
        this.accountTemplateId = accountTemplateId;
    }

    /**
     *
     * @return
     *     The accountType
     */
    public String getAccountType() {
        return accountType;
    }

    /**
     *
     * @param accountType
     *     The account_type
     */
    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    /**
     *
     * @return
     *     The systemAccount
     */
    public String getSystemAccount() {
        return systemAccount;
    }

    /**
     *
     * @param systemAccount
     *     The system_account
     */
    public void setSystemAccount(String systemAccount) {
        this.systemAccount = systemAccount;
    }

    /**
     *
     * @return
     *     The isPayment
     */
    public Boolean getIsPayment() {
        return isPayment;
    }

    /**
     *
     * @param isPayment
     *     The is_payment
     */
    public void setIsPayment(Boolean isPayment) {
        this.isPayment = isPayment;
    }

    /**
     *
     * @return
     *     The canDelete
     */
    public Boolean getCanDelete() {
        return canDelete;
    }

    /**
     *
     * @param canDelete
     *     The can_delete
     */
    public void setCanDelete(Boolean canDelete) {
        this.canDelete = canDelete;
    }

    /**
     *
     * @return
     *     The currency
     */
    public Currency getCurrency() {
        return currency;
    }

    /**
     *
     * @param currency
     *     The currency
     */
    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    /**
     *
     * @return
     *     The isCurrencyEditable
     */
    public Boolean getIsCurrencyEditable() {
        return isCurrencyEditable;
    }

    /**
     *
     * @param isCurrencyEditable
     *     The is_currency_editable
     */
    public void setIsCurrencyEditable(Boolean isCurrencyEditable) {
        this.isCurrencyEditable = isCurrencyEditable;
    }

    /**
     *
     * @return
     *     The isNameEditable
     */
    public Boolean getIsNameEditable() {
        return isNameEditable;
    }

    /**
     *
     * @param isNameEditable
     *     The is_name_editable
     */
    public void setIsNameEditable(Boolean isNameEditable) {
        this.isNameEditable = isNameEditable;
    }

    /**
     *
     * @return
     *     The isPaymentEditable
     */
    public Boolean getIsPaymentEditable() {
        return isPaymentEditable;
    }

    /**
     *
     * @param isPaymentEditable
     *     The is_payment_editable
     */
    public void setIsPaymentEditable(Boolean isPaymentEditable) {
        this.isPaymentEditable = isPaymentEditable;
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

}

