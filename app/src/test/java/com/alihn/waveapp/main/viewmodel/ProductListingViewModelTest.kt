package com.alihn.waveapp.main.viewmodel

import android.arch.core.executor.testing.InstantTaskExecutorRule
import android.arch.lifecycle.Observer
import com.alihn.waveapp.RxSchedulerRule
import com.alihn.waveapp.main.data.ProductListingRepositoryImpl
import com.alihn.waveapp.main.data.model.Product
import io.reactivex.Observable
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers
import org.mockito.Mock
import org.mockito.Mockito.*
import org.mockito.MockitoAnnotations
import org.mockito.junit.MockitoJUnit
import org.mockito.junit.MockitoJUnitRunner
import org.mockito.junit.MockitoRule
import org.mockito.quality.Strictness

/**
 * Created by 0xAliHn
 */

@RunWith(MockitoJUnitRunner::class)
class ProductListingViewModelTest {
    @Rule
    @JvmField
    var mockitoRule: MockitoRule = MockitoJUnit.rule().strictness(Strictness.STRICT_STUBS)

    // Test rule for making the RxJava to run synchronously in unit test
    @Rule
    @JvmField
    var rxSchedulerRule: RxSchedulerRule = RxSchedulerRule()

    // A JUnit Test Rule that swaps the background executor used by
    // the Architecture Components with a different one which executes each task synchronously.
    @Rule
    @JvmField
    var instantTaskExecutorRule = InstantTaskExecutorRule()

    @Mock
    private lateinit var productListingRepositoryImpl: ProductListingRepositoryImpl

    @Mock
    private lateinit var observer: Observer<List<Product>>

    private lateinit var productListingViewModel: ProductListingViewModel

    @Before
    fun setup() {
        MockitoAnnotations.initMocks(this)
        // initialize the ViewModel with a mocked repo
        productListingViewModel = ProductListingViewModel(productListingRepositoryImpl)
    }

    @Test
    fun `test fetchProductList success`() {
        val productList = ArrayList<Product>()
        // observe on the MutableLiveData with an observer
        productListingViewModel.productFetchingLiveData.observeForever(observer)

        `when`(productListingRepositoryImpl.getProductList(ArgumentMatchers.anyString())).thenReturn(Observable.just(productList))
        productListingViewModel.fetchProductList()

        // assert that the size matches
        assertEquals(productList.size, productListingViewModel.productFetchingLiveData.value?.size)

        verify(observer, atLeastOnce()).onChanged(ArgumentMatchers.any())
    }


    @Test
    fun `test fetchProductList failed`(){
        val error = Exception("Error")
        productListingViewModel.productFetchingLiveData.observeForever(observer)

        `when`(productListingRepositoryImpl.getProductList(ArgumentMatchers.anyString())).thenReturn(Observable.error(error))
        productListingViewModel.fetchProductList()

        assertEquals(null, productListingViewModel.productFetchingLiveData.value?.size)

        verify(observer, atLeastOnce()).onChanged(ArgumentMatchers.any())
    }

    @After
    fun teardown() {
    }


}
