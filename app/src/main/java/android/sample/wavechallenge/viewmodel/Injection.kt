package android.sample.wavechallenge.viewmodel

import android.sample.wavechallenge.api.WaveRemoteDataSource
import android.sample.wavechallenge.repository.ProductRepository

object Injection {
    fun provideProductRepository(): ProductRepository {
        return ProductRepository.getInstance(WaveRemoteDataSource.newInstance())
    }
}