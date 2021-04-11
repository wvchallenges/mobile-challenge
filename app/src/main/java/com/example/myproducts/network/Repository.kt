package com.example.myproducts.network

import com.example.myproducts.models.Product

class Repository {
    suspend fun getProduct():List<Product> = WaveApi().getProducts()
}