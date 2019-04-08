package com.alihn.waveapp.di

import com.alihn.waveapp.main.data.ProductListingRepository
import com.alihn.waveapp.main.data.ProductListingRepositoryImpl
import com.alihn.waveapp.main.viewmodel.ProductListingViewModel
import com.alihn.waveapp.main.viewmodel.ViewModelProviderFactory
import com.alihn.waveapp.network.ProductWebService
import dagger.Module
import dagger.Provides

/**
 * Created by 0xAliHn
 */

@Module
class ListingModule {
    @Provides
    @ListingScope
    internal fun provideProductListingRepository(productWebService: ProductWebService): ProductListingRepository {
        return ProductListingRepositoryImpl(productWebService)
    }

    @Provides
    @ListingScope
    internal fun provideProductListingViewModelFactory(productListingViewModel: ProductListingViewModel): ViewModelProviderFactory {
        return ViewModelProviderFactory(productListingViewModel)
    }
}
