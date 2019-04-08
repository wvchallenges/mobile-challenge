package com.alihn.waveapp.main.data.model

import android.os.Parcelable
import com.squareup.moshi.Json
import kotlinx.android.parcel.Parcelize

@Parcelize
data class IncomeAccount(
        @Json(name = "id")
        val id: Int, // 152400226
        @Json(name = "url")
        val url: String // https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/accounts/152400226/
): Parcelable