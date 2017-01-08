package ai.victorl.wavechallengeapp.di;

import android.app.Application;
import android.content.Context;

public class WaveChallengeApplication extends Application {
    private ApplicationComponent applicationComponent;

    public ApplicationComponent getApplicationComponent() {
        if (applicationComponent == null) {
            applicationComponent = DaggerApplicationComponent.builder()
                    .build();
        }
        return applicationComponent;
    }

    public static WaveChallengeApplication from(Context context) {
        return (WaveChallengeApplication) context.getApplicationContext();
    }

    @Override
    public void onCreate() {
        super.onCreate();
        getApplicationComponent().inject(this);
    }
}
