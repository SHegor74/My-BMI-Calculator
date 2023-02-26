
import UIKit


class Helper {
    
    static func tamicOff(views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    static func addSubView(views: [UIView], to superview: UIView) {
        for view in views {
            superview.addSubview(view)
        }
    }
}
