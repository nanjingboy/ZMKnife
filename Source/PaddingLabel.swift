import UIKit
import SpriteKit

open class PaddingLabel: PlaceholderLabel {

    open var bottomBorderColor: UIColor? {
        didSet {
            self.borderBottom.backgroundColor = self.bottomBorderColor
        }
    }

    open var padding: UIEdgeInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsDisplay()
        }
    }

    let borderBottom = UIView()

    open override func updateConstraints() {
        super.updateConstraints()
        self.borderBottom.snp.remakeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.snp.bottom).offset(-1)
            make.height.equalTo(1)
        }
    }

    open override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, self.padding))
    }

    open override func initViews() {
        self.borderBottom.backgroundColor = self.backgroundColor
        self.addSubview(self.borderBottom)
        super.initViews()
    }
}
