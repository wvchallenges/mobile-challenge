package challenge.waveproductlist.data

import io.reactivex.Single

class ProductDataManager() {

    private val apiService: WaveApiService = WaveApiService.getService()

    var businessId: String = "89746d57-c25f-4cec-9c63-34d7780b044b"
    var pageSize: Int = 5

    fun getProducts(page: Int): Single<List<Product>> {
        return apiService.getBusinessProducts(businessId, page, pageSize)
    }
}