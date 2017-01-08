package ai.victorl.wavechallengeapp.di;

import android.app.Application;

import dagger.Module;

@Module
class ApplicationModule {
    protected final Application application;

    ApplicationModule(Application application) {
        this.application = application;
    }

    // to be inherited by the associated component
    interface Graph {
    }
}
