package com.karlptrck.wavechallenge.ui

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import androidx.lifecycle.ViewModel
import androidx.paging.PagedList
import com.karlptrck.wavechallenge.data.WaveRepository
import com.karlptrck.wavechallenge.model.Product
import com.karlptrck.wavechallenge.model.ProductsResult

class ProductsViewModel(private val repository : WaveRepository) : ViewModel() {

    private val productsResult = MutableLiveData<ProductsResult>()

    val products : LiveData<PagedList<Product>> = Transformations.switchMap(productsResult, {
        it -> it.data })

    fun getProducts(){
        productsResult.postValue(repository.getProducts())
    }
}