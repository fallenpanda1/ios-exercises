import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private let tester = Tester()
    private let testResults: [Lesson: [(String, TestResult)]]

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
    func numberOfSections(in tableView: UITableView) -> Int {
        return testResults.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let lesson = Lesson.withIndex(section)
        return testResults[lesson]!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let lesson = Lesson.withIndex(indexPath.section)
        let (testName, testResult) = testResults[lesson]![indexPath.row]
        cell.textLabel?.text = testName
        switch testResult {
        case .pass:
            cell.textLabel?.textColor = UIColor(red: 0.2, green: 0.8, blue: 0.2, alpha: 1)
            cell.accessoryType = .checkmark
        case .fail:
            cell.textLabel?.textColor = .red
        case .skipped:
            cell.textLabel?.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Lesson.withIndex(section).rawValue.capitalized
    }
}
