import UIKit
import SnapKit

open class PlaceholderLabel: UILabel {

    open var placeholder: String? {
        get {
            return self.placehoderLabel.text
        }
        set(value) {
            self.placehoderLabel.text = value
            self.drawPlaceholderLabel()
        }
    }

    open var placeholderColor: UIColor {
        get {
            return self.placehoderLabel.textColor
        }
        set(value) {
            self.placehoderLabel.textColor = value
            self.drawPlaceholderLabel()
        }
    }

    open override var text: String? {
        didSet {
            self.drawPlaceholderLabel()
        }
    }

    let placehoderLabel = UILabel()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }

    open override func updateConstraints() {
        super.updateConstraints()
        if (self.text?.isEmpty ?? true) && self.subviews.contains(self.placehoderLabel) {
            self.updatePlaceerConstraints(self.placehoderLabel)
        }
    }

    open func updatePlaceerConstraints(_ label: UILabel) {
        label.snp.remakeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self)
        }
    }

    open func initViews() {
        self.placehoderLabel.isOpaque = false
        self.placehoderLabel.backgroundColor = UIColor.clear
        self.placehoderLabel.textColor = UIColor(red:0.81, green:0.81, blue:0.83, alpha:1.00)
    }

    open func drawPlaceholderLabel() {
        self.placehoderLabel.font = self.font
        self.placehoderLabel.textAlignment = self.textAlignment
        if self.text?.isEmpty ?? true {
            if !self.subviews.contains(self.placehoderLabel) {
                self.addSubview(self.placehoderLabel)
            }
        } else if self.subviews.contains(self.placehoderLabel) {
            self.placehoderLabel.removeFromSuperview()
        }
    }
}
