package ai.victorl.wavechallengeapp.ui;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import ai.victorl.wavechallengeapp.R;
import ai.victorl.wavechallengeapp.di.WaveChallengeApplication;

public class ProductsActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_products);
        WaveChallengeApplication.from(this).getApplicationComponent().inject(this);
    }
}
