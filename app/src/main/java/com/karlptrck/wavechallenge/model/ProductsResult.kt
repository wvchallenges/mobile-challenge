package com.karlptrck.wavechallenge.model

import androidx.lifecycle.LiveData
import androidx.paging.PagedList

data class ProductsResult(
    val data : LiveData<PagedList<Product>>,
    val networkErrors : LiveData<String>
)