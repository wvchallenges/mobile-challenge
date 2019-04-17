package challenge.waveproductlist.product.viewModels

import android.databinding.BaseObservable
import android.databinding.ObservableDouble
import android.databinding.ObservableField
import android.databinding.ObservableInt
import android.graphics.Color
import android.view.View
import challenge.waveproductlist.data.Product
import java.text.NumberFormat

class ProductViewModel : BaseObservable {

    constructor(product: Product) {
        this.import(product)
    }

    val id = ObservableInt()
    var name = ObservableField<String>()
    var price = ObservableDouble()
    var description = ObservableField<String>()
    var isSold = ObservableField<Boolean>()
    var position = ObservableInt()

    fun getRowColor(): Int {
        if (position.get() % 2 == 1) {
            return Color.parseColor("#e5e5e5")
        }
        else {
            return Color.parseColor("#f6f6f6")
        }
    }

    fun getCurrencyPrice(): String {
        val formatter = NumberFormat.getCurrencyInstance()
        val currencyPrice = formatter.format(this.price.get())
        return currencyPrice
    }

    fun getDescriptionVisibility(): Int {
        if (this.description.get() == "") {
            return View.GONE
        }
        else {
            return View.VISIBLE
        }
    }

    fun import(product: Product) {
        this.id.set(product.id)
        this.name.set(product.name)
        this.price.set(product.price)
        this.description.set(product.description)
        this.isSold.set(product.isSold)
    }

    companion object {
        fun import(productList: List<Product>) : List<ProductViewModel> {
            var viewModels: ArrayList<ProductViewModel> = arrayListOf()

            for (p in productList) {
                viewModels.add(ProductViewModel(p))
            }
            return viewModels
        }
    }
}