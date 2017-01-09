package ai.victorl.wavechallengeapp;

import android.content.Context;

import ai.victorl.wavechallengeapp.di.InjectedApplication;

/**
 * Custom Application class to provide dependency injection.
 */
public class WaveChallengeApplication extends InjectedApplication {
    public static WaveChallengeApplication from(Context context) {
        return (WaveChallengeApplication) context.getApplicationContext();
    }

    @Override
    public void onCreate() {
        super.onCreate();
        getApplicationComponent().inject(this);
    }
}
