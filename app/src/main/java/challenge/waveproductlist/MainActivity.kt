package challenge.waveproductlist

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import challenge.waveproductlist.product.view.ProductListFragment

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if (savedInstanceState == null) {
            // show the products list fragment
            supportFragmentManager
                .beginTransaction()
                .add(R.id.root_frame_layout, ProductListFragment.newInstance(), "productListFragment")
                .commit()
        }
    }
}
