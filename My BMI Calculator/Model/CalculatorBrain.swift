import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
//    func getBMIValue() -> String {
//        return String(format: "%.2f", arguments: [bmi?.value ?? 0.0, 2])
//    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) -> String {
        let color = (underWeight: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), normalWeight: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), overWeight: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        
        let bmiValue = height / pow(weight, 2)
        
        switch bmiValue {
        case 0..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more!", color: color.underWeight)
        case 18.5...24.9:
            bmi = BMI(value: bmiValue, advice: "Everything is OK!", color: color.normalWeight)
        case 24.9...:
            bmi = BMI(value: bmiValue, advice: "Eat less!", color: color.overWeight)
        default:
            break
        }
        return String(format: "%.2f", arguments: [bmi?.value ?? 0.0, 2])
    }
}
