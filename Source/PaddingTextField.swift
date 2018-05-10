import UIKit

open class PaddingTextField: UITextField {

    open var padding: UIEdgeInsets = UIEdgeInsets.zero

    open override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }

    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }
}
