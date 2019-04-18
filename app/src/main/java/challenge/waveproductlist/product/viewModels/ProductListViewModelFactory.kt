package challenge.waveproductlist.product.viewModels

import android.arch.lifecycle.ViewModel
import android.arch.lifecycle.ViewModelProvider
import challenge.waveproductlist.data.ProductDataManager

class ProductListViewModelFactory(private val productDataManager: ProductDataManager) : ViewModelProvider.Factory {

    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        return ProductListViewModel(productDataManager) as T
    }
}