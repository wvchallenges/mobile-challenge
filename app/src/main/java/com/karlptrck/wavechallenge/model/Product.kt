package com.karlptrck.wavechallenge.model

import androidx.room.Entity
import androidx.room.PrimaryKey
import com.google.gson.annotations.SerializedName

@Entity(tableName = "products")
data class Product(
    @PrimaryKey @field:SerializedName("id") val id : Int,
    @field:SerializedName("name") val name : String,
    @field:SerializedName("price") val price : Double
)