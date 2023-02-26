import UIKit

class ResultView: UIView {
    
    var wallpapers = UIImageView()
    
    lazy var yourResult = naviLabels(title: "YOUR RESULT", size: 35)
    lazy var result = naviLabels(title: "19.5", size: 80)
    lazy var advice = naviLabels(title: "EAT SOME MORE SNACKS!", size: 20)
    
    lazy var recalculate = naviButton(title: "RECALCULATE")
    
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
        button.setTitleColor(UIColor(red: 71/255, green: 121/255, blue: 191/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func naviLabels(title: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.font = .systemFont(ofSize: size, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }
    
    func setupViews() {
        backgroundColor = UIColor(red: 71/255, green: 121/255, blue: 191/255, alpha: 1)
        wallpapers.image = UIImage(named: "result_background")
    }
    
    func setupConstraints() {
        
        stack = UIStackView(subviews: [yourResult, result, advice], axis: .vertical, spacing: 10, aligment: .fill, distribution: .fillProportionally)
        
        Helper.tamicOff(views: [wallpapers, recalculate])
        Helper.addSubView(views: [wallpapers, stack, recalculate], to: self)
        
        NSLayoutConstraint.activate([
            wallpapers.topAnchor.constraint(equalTo: topAnchor),
            wallpapers.bottomAnchor.constraint(equalTo: bottomAnchor),
            wallpapers.leftAnchor.constraint(equalTo: leftAnchor),
            wallpapers.rightAnchor.constraint(equalTo: rightAnchor),
            
            recalculate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            recalculate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recalculate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            recalculate.heightAnchor.constraint(equalToConstant: 60),
            
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
                    
        ])
    }
}
