package com.example.myproducts

import android.app.Application
import com.example.myproducts.network.Repository

class MyProductsApp: Application() {
    val repository by lazy { Repository() }

}