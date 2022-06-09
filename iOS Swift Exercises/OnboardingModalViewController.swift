import UIKit

class OnboardingModalViewController: UIViewController {
    let titleLabel = UILabel()
    lazy var subtitleLabel = UILabel()
    var infoText: UILabel
     let fontSize = 25
    let dismissBlock: ()->()

    let stepsList: [String] = [
        "Step 1: Compile and run the project",
        "Step 2: Solve each problem",
        "Step 3: Run the tests to check if you solved the problems correctly"
    ]

    init(dismissBlock: @escaping ()->()) {
        self.dismissBlock = dismissBlock

        super.init(nibName: nil, bundle: nil)

        self.setUpView();
        self.setUpText();
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        infoText = UILabel()
        infoText.fontSize = self.fontSize

        let stack = UIStackView()
        stack.arrangedSubviews = [titleLabel, subtitleLabel, infoText]
        stack.axis = .vertical
        stack.spacing = 10

        self.view.addSubview(stack)
        stack.autoPinEdgesToSuperviewEdges(withInsets: UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8))

        titleLabel.autoPinEdge(.top, to: .top, of: stack)
    }

    func setUpText() {
        if stepsList.count == 0 {
            return
        }

        var list = [String]()

        var i = 0
        for i in 0..<10 {
            var withBullet = "* " + stepsList[i]
            list.append(withBullet)
        }

        infoText.text = stepsList.joined(separator: "\n")
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)

        self.dismissBlock()
    }
}
