import UIKit

class StartViewController: UIViewController {
    let startView = StartView()
    var calculatorBrain = CalculatorBrain()
    
    lazy var heightSlider = startView.heightSlider
    lazy var weightSlider = startView.weightSlider
    
    lazy var heightCalcLabel = startView.heightCalcLabel
    lazy var weightCalcLabel = startView.weightCalcLabel
    
    lazy var calculateButton = startView.calcButton

    override func viewDidLoad() {
        super.viewDidLoad()
        view = startView
        
        sliderAction()
        calculateAction()
    }
    
    func sliderAction() {
        heightSlider.addTarget(self, action: #selector(changeHeightSliderPosition), for: .touchDragInside)
        weightSlider.addTarget(self, action: #selector(changeWeightSliderPosition), for: .touchDragInside)
    }
    
    @objc func changeHeightSliderPosition(_ sender: UISlider) {
        heightCalcLabel.text = "\(String(format: "%.2f", arguments: [sender.value])) M"
    }
    
    @objc func changeWeightSliderPosition(_ sender: UISlider) {
        weightCalcLabel.text = "\(Int(sender.value)) Kg"
    }
    
    func calculateAction() {
        calculateButton.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
    }
    
    @objc func calculatePressed() {
        let bmi = calculatorBrain.calculateBMI(height: weightSlider.value, weight: heightSlider.value)
        
        let resultVC = ResultViewController()
        resultVC.resultLabel.text = bmi
        resultVC.advicelabel.text = calculatorBrain.getAdvice()
        resultVC.resultBackground = calculatorBrain.getColor()
        self.present(resultVC, animated: true)
        
        
    }


}

