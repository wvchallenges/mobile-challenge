package android.sample.wavechallenge.fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import android.sample.wavechallenge.R
import android.sample.wavechallenge.adapter.ProductListAdapter
import android.sample.wavechallenge.model.Product
import android.sample.wavechallenge.viewmodel.Injection
import android.sample.wavechallenge.viewmodel.ProductViewModel
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.fragment_product_list.*

const val BUSINESS_ID = "c0c898a6-d61d-4768-9262-e9a66a1a789d"

class ProductListFragment : Fragment() {
    private lateinit var productViewModel: ProductViewModel

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_product_list, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setRecyclerView(listOf())

        productViewModel = ViewModelProviders.of(
            this,
            ProductViewModel.FACTORY(Injection.provideProductRepository(), BUSINESS_ID)
        ).get(ProductViewModel::class.java)

        productViewModel.products.observe(viewLifecycleOwner, Observer { value ->
            value?.let {
                (rv_product_list.adapter as ProductListAdapter).updateItems(it)
            }
        })

        // show the spinner when [ProductViewModel.spinner] is true
        productViewModel.spinner.observe(viewLifecycleOwner, Observer { value ->
            value?.let { show ->
                pb_loading.visibility =
                    if (show) {
                        View.VISIBLE
                    } else {
                        View.GONE
                    }
            }
        })

        // Show a snackbar whenever the [ProductViewModel.snackbar] is updated to a non-null value
        productViewModel.snackbar.observe(viewLifecycleOwner, Observer { text ->
            text?.let {
                Snackbar.make(cl_product, text, Snackbar.LENGTH_SHORT).show()
                productViewModel.onSnackbarShown()
            }
        })
    }

    private fun setRecyclerView(productList: List<Product>) {
        rv_product_list.layoutManager = LinearLayoutManager(context, RecyclerView.VERTICAL, false)
        val adapter = ProductListAdapter(context, productList)
        rv_product_list.adapter = adapter
    }
}