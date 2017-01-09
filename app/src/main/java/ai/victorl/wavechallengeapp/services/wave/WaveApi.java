package ai.victorl.wavechallengeapp.services.wave;

import ai.victorl.wavechallengeapp.BuildConfig;

/**
 * Static class to hold Wave API attributes.
 */
public class WaveApi {
    public static final String WAVE_API_BASE_URL = "https://api.waveapps.com/";
    public static final String DEMO_BUSINESS_ID = BuildConfig.WAVE_BUSINESS_ID;
    public static final String DEMO_WAVE_API_KEY = BuildConfig.WAVE_ACCESS_TOKEN;

    private WaveApi() {
    }
}
