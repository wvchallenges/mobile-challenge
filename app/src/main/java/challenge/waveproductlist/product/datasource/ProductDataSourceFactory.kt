package challenge.waveproductlist.product.datasource

import android.arch.lifecycle.MutableLiveData
import android.arch.paging.DataSource
import challenge.waveproductlist.data.ProductDataManager
import challenge.waveproductlist.product.viewModels.ProductViewModel
import io.reactivex.disposables.CompositeDisposable

class ProductDataSourceFactory(private val productDataManager: ProductDataManager,
                               private val compositeDisposable: CompositeDisposable): DataSource.Factory<Long, ProductViewModel>() {

    val mutableLiveData: MutableLiveData<ProductDataSource>
    private lateinit var dataSource: ProductDataSource

    init {
        this.mutableLiveData = MutableLiveData()
    }

    override fun create(): DataSource<Long, ProductViewModel> {
        dataSource = ProductDataSource(productDataManager, compositeDisposable)
        mutableLiveData.postValue(dataSource)
        return dataSource
    }
}