package com.alihn.waveapp.di


import com.alihn.waveapp.main.ui.ProductListingFragment

import dagger.Subcomponent

/**
 * Created by 0xAliHn
 */

@ListingScope
@Subcomponent(modules = [ListingModule::class])
interface ListingComponent {
    fun inject(fragment: ProductListingFragment): ProductListingFragment

}
