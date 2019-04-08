package com.alihn.waveapp

import android.app.Application

import com.alihn.waveapp.di.ListingComponent
import com.alihn.waveapp.di.ListingModule
import com.alihn.waveapp.network.NetworkModule
import timber.log.Timber

/**
 * Created by 0xAliHn
 */

class BaseApplication : Application() {
    private var appComponent: AppComponent? = null
    private var listingComponent: ListingComponent? = null

    override fun onCreate() {
        super.onCreate()
        appComponent = createAppComponent()
        Timber.plant(Timber.DebugTree())
    }

    private fun createAppComponent(): AppComponent {
        return DaggerAppComponent.builder()
                .appModule(AppModule(this))
                .networkModule(NetworkModule())
                .build()
    }


    fun createListingComponent(): ListingComponent? {
        listingComponent = appComponent?.plus(ListingModule())
        return listingComponent
    }

    fun releaseListingComponent() {
        listingComponent = null
    }

}
