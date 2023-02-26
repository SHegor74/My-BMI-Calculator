import UIKit

class ResultViewController: UIViewController {
    let resultView = ResultView()
    lazy var resultLabel = resultView.result
    lazy var advicelabel = resultView.advice
    var resultBackground = UIColor()
    lazy var recalculateButton = resultView.recalculate

    override func viewDidLoad() {
        super.viewDidLoad()
        view = resultView
        view.backgroundColor = resultBackground
        recalculateAction()
        
    }
    
    func recalculateAction() {
        recalculateButton.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
    }
    
    @objc func calculatePressed() {
        self.dismiss(animated: true)
    }
}

