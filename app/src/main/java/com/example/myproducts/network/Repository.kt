package com.example.myproducts.network

import com.example.myproducts.models.Product

class Repository {
    suspend fun getProducts(): List<Product> = WaveApi().getProducts()
}