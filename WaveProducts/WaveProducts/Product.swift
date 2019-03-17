import Foundation

struct Product: Decodable {
    let id: Int
    let name: String
    let price: Decimal // assuming USD
}
