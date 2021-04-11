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

    private val _spinner = MutableLiveData<Boolean>()
    val spinner : LiveData<Boolean> =_spinner

    val errorEvent = LiveEvent<String>()

    fun getProducts() {
        viewModelScope.launch {
            try {
                _spinner.value = true
                _products.value = repository.getProduct()
            } catch (e: Exception) {
                errorEvent.post(e.toString())
            } finally {
                _spinner.value = false
            }
        }
    }
}


@Suppress("UNCHECKED_CAST")
class ProductsViewModelFactory(private val repo: Repository): ViewModelProvider.Factory{
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        if(modelClass.isAssignableFrom(ProductsViewModel::class.java)){
            return ProductsViewModel(repo) as T
        }
        throw IllegalArgumentException("Unknown View Model Class")
    }

}