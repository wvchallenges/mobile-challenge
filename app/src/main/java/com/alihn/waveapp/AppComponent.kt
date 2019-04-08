package com.alihn.waveapp

import com.alihn.waveapp.di.ListingComponent
import com.alihn.waveapp.di.ListingModule
import com.alihn.waveapp.network.NetworkModule
import dagger.Component
import javax.inject.Singleton

/**
 * Created by 0xAliHn
 */

@Singleton
@Component(modules = [AppModule::class, NetworkModule::class])
interface AppComponent {
    operator fun plus(listingModule: ListingModule): ListingComponent
}
