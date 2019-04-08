package com.karlptrck.wavechallenge.ui

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.karlptrck.wavechallenge.data.WaveRepository

class ProductsViewModelFactory(private val repository : WaveRepository) : ViewModelProvider.Factory{

    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return ProductsViewModel(repository) as T
    }
}