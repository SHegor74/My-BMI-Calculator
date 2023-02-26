import UIKit

class StartView: UIView {
    
    var wallpapers = UIImageView()
    
    lazy var calcLabel = naviLabels(title: "CALCULATE YOUR BMI", size: 40)
    lazy var heightLabel = naviLabels(title: "Height", size: 17)
    lazy var heightCalcLabel = naviLabels(title: "1.5 M", size: 17)
    lazy var weightLabel = naviLabels(title: "Weight", size: 17)
    lazy var weightCalcLabel = naviLabels(title: "100 Kg", size: 17)
    
    var heightSlider = UISlider()
    var weightSlider = UISlider()
    
    lazy var calcButton = naviButton(title: "CALCULATE")
    
    var heightStack = UIStackView()
    var weightStack = UIStackView()
    var stack = UIStackView()
    
    init() {
        super.init(frame: CGRect())
        setupConstraints()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func naviButton(title: String) -> UIButton {
        let button = UIButton()
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.backgroundColor = UIColor(red: 98/255, green: 96/255, blue: 153/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func naviLabels(title: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: size, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }
    
    func setupViews() {
        wallpapers.image = UIImage(named: "calculate_background")
        
        heightSlider.value = 1.5
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 3
                
        weightSlider.value = 100
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 200
        
    }
    
    func setupConstraints() {
        heightStack = UIStackView(subviews: [heightLabel, heightCalcLabel], axis: .horizontal, spacing: 0, aligment: .fill, distribution: .equalSpacing)
        
        weightStack = UIStackView(subviews: [weightLabel, weightCalcLabel], axis: .horizontal, spacing: 0, aligment: .fill, distribution: .equalSpacing)
        
        stack = UIStackView(subviews: [heightStack, heightSlider, weightStack, weightSlider], axis: .vertical, spacing: 20, aligment: .fill, distribution: .fillEqually)
        
        Helper.tamicOff(views: [wallpapers, calcLabel, calcButton])
        Helper.addSubView(views: [wallpapers, calcLabel, stack, calcButton], to: self)
        
        NSLayoutConstraint.activate([
            wallpapers.topAnchor.constraint(equalTo: topAnchor),
            wallpapers.bottomAnchor.constraint(equalTo: bottomAnchor),
            wallpapers.leftAnchor.constraint(equalTo: leftAnchor),
            wallpapers.rightAnchor.constraint(equalTo: rightAnchor),
            
            calcLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            calcLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calcLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            calcButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 20),
            calcButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            calcButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calcButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            calcButton.heightAnchor.constraint(equalToConstant: 60),
            
            stack.topAnchor.constraint(equalTo: calcLabel.bottomAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: calcButton.topAnchor, constant: -50),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
            heightStack.heightAnchor.constraint(equalToConstant: 21),

            weightStack.heightAnchor.constraint(equalToConstant: 21),

            heightSlider.heightAnchor.constraint(equalToConstant: 60),

            weightSlider.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
