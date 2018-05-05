import UIKit
import SnapKit

open class TitleAndValueTextView: BorderBottomView {

    open var titleLabelWidth: CGFloat?
    open var isRequired: Bool = false
    open var leftPadding: CGFloat = 16
    open var rightPadding: CGFloat = 16

    open let titleLabel = UILabel()
    open let valueLabel = PlaceholderLabel()

    let requiredLabel = UILabel()

    open override func updateConstraints() {
        super.updateConstraints()
        var titleLeftPadding: CGFloat
        if self.isRequired {
            self.requiredLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(self.leftPadding)
                make.width.equalTo(6)
                make.top.bottom.equalTo(self)
            }
            titleLeftPadding = self.leftPadding + 8
        } else {
            titleLeftPadding = self.leftPadding
        }
        if let titleLabelWidth = self.titleLabelWidth {
            self.titleLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(titleLeftPadding)
                make.width.equalTo(titleLabelWidth)
                make.top.bottom.equalTo(self)
            }
        } else {
            self.titleLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(titleLeftPadding)
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

        self.requiredLabel.font = UIFont.systemFont(ofSize: 14)
        self.requiredLabel.textColor = UIColor.red
        self.requiredLabel.text = "*"
        self.addSubview(self.requiredLabel)

        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(self.titleLabel)
    
        self.valueLabel.font = UIFont.systemFont(ofSize: 14)
        self.valueLabel.textAlignment = NSTextAlignment.right
        self.addSubview(self.valueLabel)
        super.initViews()
    }
}
