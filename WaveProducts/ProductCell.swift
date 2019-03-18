import UIKit

final class ProductCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel?
    @IBOutlet private var priceLabel: UILabel?

    var product: Product? {
        didSet {
            nameLabel?.text = product?.name
            priceLabel?.text = product?.formattedPrice
        }
    }
}

private extension Product {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: price as NSNumber)!
    }
}
