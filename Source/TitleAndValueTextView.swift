import UIKit
import SnapKit

open class TitleAndValueTextView: BorderBottomView {

    open var titleWidth: CGFloat?
    open var leftPadding: CGFloat = 16
    open var rightPadding: CGFloat = 16

    open var title: String? {
        didSet {
            self.titleLabel.text = self.title
        }
    }

    open var titleColor: UIColor = UIColor.black {
        didSet {
            self.titleLabel.textColor = self.titleColor
        }
    }

    open var titleFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.titleLabel.font = self.titleFont
        }
    }

    open var value: String? {
        didSet {
            self.valueLabel.text = self.value
        }
    }

    open var valueColor: UIColor = UIColor.black {
        didSet {
            self.valueLabel.textColor = self.valueColor
        }
    }

    open var valueFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.valueLabel.font = self.valueFont
        }
    }

    open var isValueAlignRight: Bool = true {
        didSet {
            if self.isValueAlignRight {
                self.valueLabel.textAlignment = .right
            } else {
                self.valueLabel.textAlignment = .left
            }
        }
    }

    let titleLabel = UILabel()
    let valueLabel = UILabel()

    open override func updateConstraints() {
        super.updateConstraints()
        if let titleWidth = self.titleWidth {
            self.titleLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(self.leftPadding)
                make.width.equalTo(titleWidth)
                make.top.bottom.equalTo(self)
            }
        } else {
            self.titleLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(self.leftPadding)
                make.right.equalTo(self.snp.centerX)
                make.top.bottom.equalTo(self)
            }
        }
        self.updateValueLabelConstraints()
    }

    open func updateValueLabelConstraints() {
        self.valueLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right)
            make.right.equalTo(self).offset(-rightPadding)
            make.top.bottom.equalTo(self)
        }
    }

    override open func initViews() {
        self.backgroundColor = UIColor.white

        self.titleLabel.text = self.title
        self.titleLabel.font = self.titleFont
        self.titleLabel.textColor = self.titleColor
        self.addSubview(self.titleLabel)
    
        self.valueLabel.text = self.value
        self.valueLabel.font = self.valueFont
        self.valueLabel.textColor = self.valueColor
        self.valueLabel.textAlignment = NSTextAlignment.right
        self.addSubview(self.valueLabel)
        super.initViews()
    }
}
