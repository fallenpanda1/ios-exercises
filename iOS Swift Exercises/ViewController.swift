import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.allowsSelection = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.frame = self.view.bounds

        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Test Cell"
        return cell
    }
}
