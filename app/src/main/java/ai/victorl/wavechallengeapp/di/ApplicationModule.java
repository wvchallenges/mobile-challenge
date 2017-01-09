package ai.victorl.wavechallengeapp.di;

import android.app.Application;

import javax.inject.Singleton;

import ai.victorl.wavechallengeapp.services.wave.ProductsService;
import ai.victorl.wavechallengeapp.services.wave.WaveApi;
import ai.victorl.wavechallengeapp.ui.ProductsAdapter;
import dagger.Module;
import dagger.Provides;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Dagger Module to declare Application dependencies.
 */
@Module
class ApplicationModule {
    protected final Application application;

    ApplicationModule(Application application) {
        this.application = application;
    }

    @Provides
    @Singleton
    Retrofit provideWaveRetrofit() {
        return new Retrofit.Builder()
                .baseUrl(WaveApi.WAVE_API_BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }

    @Provides
    ProductsService provideProductsService(Retrofit retrofit) {
        return retrofit.create(ProductsService.class);
    }

    @Provides
    ProductsAdapter provideProductsListAdapter() {
        return new ProductsAdapter();
    }

    /**
     * Module Provides graph to be inherited by the owning Component.
     */
    public interface Graph {
        Retrofit retrofit();
        ProductsService productsService();
        ProductsAdapter productsListAdapter();
    }
}
