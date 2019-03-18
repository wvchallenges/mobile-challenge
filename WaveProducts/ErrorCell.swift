import UIKit

final class ErrorCell: UITableViewCell {
    @IBOutlet private var errorDescriptionLabel: UILabel?
    var retryAction = {}

    var error: Error? {
        didSet {
            errorDescriptionLabel?.text = error?.localizedDescription
        }
    }

    @IBAction private func retry() {
        retryAction()
    }
}
