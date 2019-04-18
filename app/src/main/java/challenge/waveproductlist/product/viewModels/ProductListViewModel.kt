package challenge.waveproductlist.product.viewModels

import android.arch.lifecycle.LiveData
import android.arch.lifecycle.ViewModel
import android.arch.paging.LivePagedListBuilder
import android.arch.paging.PagedList
import challenge.waveproductlist.data.ProductDataManager
import challenge.waveproductlist.product.datasource.ProductDataSourceFactory
import io.reactivex.disposables.CompositeDisposable

class ProductListViewModel(val productManager: ProductDataManager) : ViewModel() {

    private val compositeDisposable = CompositeDisposable()
    private val sourceFactory: ProductDataSourceFactory

    var productList: LiveData<PagedList<ProductViewModel>>

    init {
        sourceFactory = ProductDataSourceFactory(
            productManager,
            compositeDisposable
        )

        val config = PagedList.Config.Builder()
            .setPageSize(productManager.pageSize)
            .setInitialLoadSizeHint(productManager.pageSize * 2)
            .setEnablePlaceholders(false)
            .build()

        productList = LivePagedListBuilder<Long, ProductViewModel>(sourceFactory, config).build()
    }

    override fun onCleared() {
        super.onCleared()
        compositeDisposable.dispose()
    }
}