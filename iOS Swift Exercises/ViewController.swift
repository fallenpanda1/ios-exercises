import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private let tester = Tester()
    private var testResults: [Lesson: [(String, TestResult)]]!
    private var didAnyTestPass: Bool {
        for (_, testsAndResults) in testResults {
            for (_, result) in testsAndResults {
                if result == .pass {
                    return true
                }
            }
        }
        return false
    }

    init() {
        super.init(nibName: nil, bundle: nil)

        // Rx I miss you...
        tester.errorsReceived = { [weak self] errors in
            guard let self = self else { return }

            var formattedError = "Failures:\n"
            for error in errors {
                formattedError.append(error + "\n")
            }
            self.consoleText.text = formattedError
        }

        testResults = tester.runAllTests()
        if !didAnyTestPass {
            // introduce user to this app
            consoleText.text =
            """
            Welcome to iOS Swift Exercises! You will be learning Swift by writing code. To start \
            out, navigate to the SwiftBasics.swift file in Xcode and complete EXERCISE 1 (i.e. \
            implement the 'addIntegers' function).
            """
            consoleText.textColor = .black
        }
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

    private lazy var consoleText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .red
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.frame = self.view.bounds

        tableView.reloadData()

        let consoleView = UIView()
        consoleView.backgroundColor = .white
        view.addSubview(consoleView)
        consoleView.frame = CGRect(
            x: 0,
            y: view.frame.height * 0.7,
            width: view.frame.width,
            height: view.frame.height * 0.3
        )

        consoleView.layer.borderColor = UIColor.black.cgColor
        consoleView.layer.borderWidth = 2

        consoleView.addSubview(consoleText)
        consoleText.frame = CGRect(
            x: 10,
            y: 10,
            width: consoleView.frame.width - 20,
            height: consoleView.frame.height - 20
        )
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
            cell.textLabel?.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Lesson.withIndex(section).rawValue.capitalized
    }
}
