package com.example.myproducts.models

import com.google.gson.annotations.SerializedName
import java.math.BigDecimal

data class Product(
    val id: Int,
    val url: String,
    val name: String,
    val price: BigDecimal,
    val description: String,
    @SerializedName("is_sold")
    val isSold: Boolean,
    @SerializedName("is_bought")
    val isBought: Boolean,
    val incomeAccount: IncomeAccount,
    val expenseAccount: ExpenseAccount,
    val active: Boolean,
    @SerializedName("date_created")
    val dateCreated: String,
    @SerializedName("data_modified")
    val dateModified: String,
)

data class ExpenseAccount(
    val id: Int,
    val url: String
)

data class IncomeAccount(
    val id: Int,
    val url: String
)
