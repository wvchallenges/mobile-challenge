package ai.victorl.wavechallengeapp.di;

import ai.victorl.wavechallengeapp.ui.ProductsActivity;
import dagger.Component;

@Component
public interface ApplicationComponent extends ApplicationModule.Graph {
    void inject(WaveChallengeApplication target);
    void inject(ProductsActivity target);
}
