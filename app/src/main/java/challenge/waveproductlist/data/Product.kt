package challenge.waveproductlist.data

data class Product(var id: Int,
                   var url: String,
                   var name: String,
                   var price: Double,
                   var description: String,
                   var isSold: Boolean,
                   var isBought: Boolean,
                   var active: Boolean,
                   var dateCreated: String,
                   var dateModified: String)