package com.alihn.waveapp.main.data.model

import android.os.Parcelable
import com.squareup.moshi.Json
import kotlinx.android.parcel.Parcelize
import kotlinx.android.parcel.RawValue

@Parcelize
data class Product(
        @Json(name = "active")
        val active: Boolean, // true
        @Json(name = "date_created")
        val dateCreated: String, // 2016-03-02T16:12:19+00:00
        @Json(name = "date_modified")
        val dateModified: String, // 2016-03-02T16:12:19+00:00
        @Json(name = "default_sales_taxes")
        val defaultSalesTaxes: @RawValue List<Any>,
        @Json(name = "description")
        val description: String, // A delicious fruit
        @Json(name = "expense_account")
        val expenseAccount: @RawValue Any, // null
        @Json(name = "id")
        val id: Int, // 6102823
        @Json(name = "income_account")
        val incomeAccount: @RawValue IncomeAccount,
        @Json(name = "is_bought")
        val isBought: Boolean, // false
        @Json(name = "is_sold")
        val isSold: Boolean, // true
        @Json(name = "name")
        val name: String, // Apples
        @Json(name = "price")
        val price: Int, // 2
        @Json(name = "url")
        val url: String // https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/6102823/
): Parcelable