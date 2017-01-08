package ai.victorl.wavechallengeapp.di;

import android.app.Application;

import java.io.File;

import javax.inject.Singleton;

import ai.victorl.wavechallengeapp.services.wave.ProductsService;
import ai.victorl.wavechallengeapp.ui.ProductsAdapter;
import dagger.Module;
import dagger.Provides;
import okhttp3.Cache;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

@Module
class ApplicationModule {
    private static final int DISK_CACHE_SIZE = 52428800; // 50MB
    protected final Application application;

    ApplicationModule(Application application) {
        this.application = application;
    }

    @Provides
    @Singleton
    OkHttpClient provideOkHttpClient() {
        // Install an HTTP cache in the application cache directory.
        File cacheDir = new File(application.getCacheDir(), "http");
        Cache cache = new Cache(cacheDir, DISK_CACHE_SIZE);
        return new OkHttpClient.Builder().cache(cache).build();
    }

    @Provides
    @Singleton
    Retrofit provideWaveRetrofit(OkHttpClient okHttpClient) {
        return new Retrofit.Builder()
                .baseUrl("https://api.waveapps.com/")
                .client(okHttpClient)
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

    // to be inherited by the owning component
    public interface Graph {
        OkHttpClient okHttpClient();
        Retrofit retrofit();
        ProductsService productsService();
        ProductsAdapter productsListAdapter();
    }
}
