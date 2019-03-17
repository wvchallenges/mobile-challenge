import UIKit

final class ProductsViewController: UIViewController {
    var waveAPI: WaveAPI?
    var businessId: String?

    @IBOutlet private var tableView: UITableView?
    @IBOutlet private var activityIndicator: UIActivityIndicatorView?
    @IBOutlet private var activityBarItem: UIBarButtonItem?
    @IBOutlet private var refreshBarItem: UIBarButtonItem?

    private enum State {
        case unknown
        case loading
        case success([Product])
        case failed(Error)
    }

    private var state = State.unknown {
        didSet {
            tableView?.reloadData()
            if case .loading = state {
                navigationItem.rightBarButtonItem = activityBarItem
                activityIndicator?.startAnimating()
            } else {
                navigationItem.rightBarButtonItem = refreshBarItem
                activityIndicator?.stopAnimating()
            }
        }
    }

    @IBAction private func refresh() {
        if case .loading = state {
            assertionFailure("Refresh called while already in progress")
        }
        guard let waveAPI = self.waveAPI, let businessId = self.businessId else {
            assertionFailure("Refresh called before waveAPI and businessId were provided")
            return
        }
        state = .loading
        waveAPI.getProducts(businessId: businessId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.state = .failed(error)
                case .success(let products):
                    self?.state = .success(products)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .unknown, .loading:
            return 5 // placeholder cells
        case .failed:
            return 1 // error cell
        case .success(let products):
            return products.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch state {
        case .unknown, .loading:
            return tableView.dequeueReusableCell(withIdentifier: "ProductPlaceholderCell", for: indexPath)
        case .failed(let error):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ErrorCell", for: indexPath) as! ErrorCell
            cell.error = error
            cell.retryAction = { [weak self] in self?.refresh() }
            return cell
        case .success(let products):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
            cell.product = products[indexPath.row]
            return cell
        }
    }
}
