package ai.victorl.wavechallengeapp.di;

import android.app.Application;

/**
 * Base Application class with dependency injection.
 */
public abstract class InjectedApplication extends Application {
    private ApplicationComponent applicationComponent;

    public ApplicationComponent getApplicationComponent() {
        if (applicationComponent == null) {
            applicationComponent = DaggerApplicationComponent.builder()
                    .applicationModule(new ApplicationModule(this))
                    .build();
        }
        return applicationComponent;
    }
}
