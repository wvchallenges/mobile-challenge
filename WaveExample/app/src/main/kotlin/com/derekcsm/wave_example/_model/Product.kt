package com.derekcsm.wave_example._model

import com.squareup.moshi.Json

data class Product(
    var id: Int = 0,
    var url: String,
    var name: String,
    var price: Float = 0.toFloat(),
    var description: String? = null,
    @Json(name = "is_active") var isActive: Boolean = false,
    @Json(name = "date_created") var dateCreated: String,
    @Json(name = "date_modified") var dateModified: String
)