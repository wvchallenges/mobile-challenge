package challenge.waveproductlist.product.datasource

import android.arch.paging.ItemKeyedDataSource
import android.util.Log
import challenge.waveproductlist.data.Product
import challenge.waveproductlist.data.ProductDataManager
import challenge.waveproductlist.product.viewModels.ProductViewModel
import io.reactivex.disposables.CompositeDisposable

class ProductDataSource(private val productDataManager: ProductDataManager,
                        private val compositeDisposable: CompositeDisposable): ItemKeyedDataSource<Long, ProductViewModel>() {

    private var page: Int = 1

    override fun loadInitial(params: LoadInitialParams<Long>, callback: LoadInitialCallback<ProductViewModel>) {
        // get the initial set of products from the api
        compositeDisposable.add(productDataManager.getProducts(page++)
            .map { transformTo(it) }
            .subscribe({ response -> callback.onResult(response) }, { t -> logError(t) }))
    }

    override fun loadAfter(params: LoadParams<Long>, callback: LoadCallback<ProductViewModel>) {
        // get all subsequent sets of product pages
        compositeDisposable.add(productDataManager.getProducts(page++)
            .map { transformTo(it) }
            .subscribe({ response -> callback.onResult(response) }, { t -> logError(t) }))
    }

    override fun loadBefore(params: LoadParams<Long>, callback: LoadCallback<ProductViewModel>) { }

    override fun getKey(item: ProductViewModel): Long {
        return item.id.get().toLong()
    }

    // transform the product model to viewModel
    private fun transformTo(products: List<Product>): List<ProductViewModel> {
        return ProductViewModel.import(products)
    }

    private fun logError(throwable: Throwable) {
        Log.e("ProductDataSource", throwable.localizedMessage, throwable);
    }
}