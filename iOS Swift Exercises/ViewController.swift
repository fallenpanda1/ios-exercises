import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private let tester = Tester()
    private let testResults: [(String, Bool)]

    init() {
        testResults = tester.runAllTests()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        return testResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let (testName, testResult) = testResults[indexPath.row]
        cell.textLabel?.text = testName
        if testResult == true {
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = .red
        }
        return cell
    }
}
