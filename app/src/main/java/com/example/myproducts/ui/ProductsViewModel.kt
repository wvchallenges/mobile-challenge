package com.example.myproducts.ui

import androidx.lifecycle.*
import com.example.myproducts.models.Product
import com.example.myproducts.network.Repository
import de.ueen.liveevent.LiveEvent
import kotlinx.coroutines.launch


private const val TAG = "ProductsViewModel"

class ProductsViewModel(private val repository: Repository) : ViewModel() {

    private val _products = MutableLiveData<List<Product>>()
    val products: LiveData<List<Product>> = _products

    private val _loading = MutableLiveData<Boolean>()
    val loading: LiveData<Boolean> = _loading

    val errorEvent = LiveEvent<String>()

    fun getProducts() {
        viewModelScope.launch {
            try {
                _loading.value = true
                _products.value = repository.getProducts()
            } catch (e: Exception) {
                errorEvent.post(e.toString())
            } finally {
                _loading.value = false
            }
        }
    }
}


@Suppress("UNCHECKED_CAST")
class ProductsViewModelFactory(private val repo: Repository) : ViewModelProvider.Factory {
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(ProductsViewModel::class.java)) {
            return ProductsViewModel(repo) as T
        }
        throw IllegalArgumentException("Unknown View Model Class")
    }

}