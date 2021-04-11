package com.example.myproducts.ui


import android.util.Log
import androidx.lifecycle.*
import com.example.myproducts.models.Product
import com.example.myproducts.network.Repository
import de.ueen.liveevent.LiveEvent
import kotlinx.coroutines.launch


private const val TAG = "ProductsViewModel"

class ProductsViewModel(val repository: Repository) : ViewModel() {

   // private var repository = Repository()

    private val _products = MutableLiveData<List<Product>>()

    val products: LiveData<List<Product>> = _products

    private val spinner = MutableLiveData<Boolean>()

    private val errorEvent = LiveEvent<String>()

    private val connectivityEvent = LiveEvent<Boolean>()

    fun getProducts() {
        viewModelScope.launch {
            try {
                spinner.value = true
                //products.value = listOf<Product>()
                _products.value = repository.getProduct()
            } catch (e: Exception) {
                Log.e(TAG, "searchBooks: $e}")
                errorEvent.post(e.toString())
            } finally {
                spinner.value = false
            }

        }
    }


}


class ProductsViewModelFactory(private val repo: Repository): ViewModelProvider.Factory{
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        if(modelClass.isAssignableFrom(ProductsViewModel::class.java)){
            return ProductsViewModel(repo) as T
        }
        throw IllegalArgumentException("Unknown View Model Class")
    }

}