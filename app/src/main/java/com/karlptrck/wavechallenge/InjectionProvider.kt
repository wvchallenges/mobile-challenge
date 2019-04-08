package com.karlptrck.wavechallenge

import android.content.Context
import androidx.lifecycle.ViewModelProvider
import com.karlptrck.wavechallenge.api.WaveService
import com.karlptrck.wavechallenge.data.WaveRepository
import com.karlptrck.wavechallenge.db.LocalCache
import com.karlptrck.wavechallenge.db.ProductDatabase
import com.karlptrck.wavechallenge.ui.ProductsViewModelFactory
import java.util.concurrent.Executors

object InjectionProvider {

    private fun provideLocalCache(context: Context) : LocalCache {
        val db = ProductDatabase.getInstance(context)
        return LocalCache(db.productsDao(),  Executors.newSingleThreadExecutor())
    }

    private fun provideWaveRepository(context: Context) : WaveRepository {
        return WaveRepository(WaveService.create(), provideLocalCache(context), context)
    }

    fun provideViewModelFactory(context: Context) : ViewModelProvider.Factory{
        return ProductsViewModelFactory(provideWaveRepository(context))
    }
}