import UIKit
import SnapKit

open class PaddingLabel: PlaceholderLabel {

    open var bottomBorderColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }

    open var padding: UIEdgeInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsDisplay()
        }
    }

    let bottomBorderLayer = CALayer()

    open override func updatePlaceerConstraints(_ label: UILabel) {
        label.snp.remakeConstraints { (make) in
            make.left.equalTo(self).offset(self.padding.left)
            make.right.equalTo(self).offset(-self.padding.right)
            make.top.equalTo(self).offset(self.padding.top)
            make.bottom.equalTo(self).offset(-self.padding.bottom)
        }
    }

    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        if !(self.layer.sublayers?.contains(self.bottomBorderLayer) ?? false) {
            self.layer.addSublayer(self.bottomBorderLayer)
        }
        self.bottomBorderLayer.backgroundColor = self.bottomBorderColor?.cgColor
        self.bottomBorderLayer.frame = CGRect(x: 0, y: self.bounds.height - 1, width: self.bounds.width, height: 1)
    }

    open override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, self.padding))
    }
}
