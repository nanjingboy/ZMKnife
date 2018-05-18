import UIKit

open class PaddingTextField: UITextField {
    
    open var bottomBorderColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }

    open var padding: UIEdgeInsets = UIEdgeInsets.zero

    let bottomBorderLayer = CALayer()

    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        if !(self.layer.sublayers?.contains(self.bottomBorderLayer) ?? false) {
            self.layer.addSublayer(self.bottomBorderLayer)
        }
        self.bottomBorderLayer.backgroundColor = self.bottomBorderColor?.cgColor
        self.bottomBorderLayer.frame = CGRect(x: 0, y: self.bounds.height - 1, width: self.bounds.width, height: 1)
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
