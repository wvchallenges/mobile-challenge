package android.sample.wavechallenge.viewmodel

import android.sample.wavechallenge.api.RemoteDataNotFoundException
import android.sample.wavechallenge.repository.ProductRepository
import androidx.lifecycle.*
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch

open class ProductViewModel(
    private val productRepository: ProductRepository,
    businessId: String
) : ViewModel() {
    companion object {
        /**
         * Factory for creating [ProductViewModel]
         */
        val FACTORY = doubleArgViewModelFactory(::ProductViewModel)
    }

    init {
        refreshProducts(businessId)
    }

    /**
     * Request a snackbar to display the error string.
     */
    private var _snackBar: MutableLiveData<String> = MutableLiveData()
    val snackbar: LiveData<String>
        get() = _snackBar

    /**
     * Show a loading spinner if true
     */
    private var _spinner: MutableLiveData<Boolean> = MutableLiveData()
    val spinner: LiveData<Boolean>
        get() = _spinner

    /**
     * Update products via this livedata
     */
    val products = productRepository.products

    /**
     * Called immediately after the UI shows the snackbar.
     */
    fun onSnackbarShown() {
        _snackBar.value = null
    }

    /**
     * Refresh the products, showing a loading spinner while it refreshes and errors via snackbar
     */
    fun refreshProducts(businessId: String) {
        launchDataLoad {
            productRepository.refreshProducts(businessId)
        }
    }

    /**
     * Helper function to call a data load function with a loading spinner
     * */
    private fun launchDataLoad(block: suspend () -> Unit): Job {
        return viewModelScope.launch {
            try {
                _spinner.value = true
                block()
            } catch (error: RemoteDataNotFoundException) {
                // Errors will trigger a snackbar.
                _snackBar.value = error.message
            } finally {
                _spinner.value = false
            }
        }
    }

}