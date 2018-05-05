import UIKit
import SnapKit

open class TitleTextField: BorderBottomView {

    open var labelWidth: CGFloat?
    open var isRequired: Bool = false
    open var leftPadding: CGFloat = 16
    open var rightPadding: CGFloat = 16

    open let label = UILabel()
    open let textField = UITextField()

    let requiredLabel = UILabel()

    open override func updateConstraints() {
        super.updateConstraints()
        var labelLeftPadding: CGFloat
        if self.isRequired {
            self.requiredLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(self.leftPadding)
                make.width.equalTo(6)
                make.top.bottom.equalTo(self)
            }
            labelLeftPadding = self.leftPadding + 8
        } else {
            labelLeftPadding = self.leftPadding
        }
        if let labelWidth = self.labelWidth {
            self.label.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(labelLeftPadding)
                make.width.equalTo(labelWidth)
                make.top.bottom.equalTo(self)
            }
        } else {
            self.label.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(labelLeftPadding)
                make.right.equalTo(self.snp.centerX)
                make.top.bottom.equalTo(self)
            }
        }
        self.textField.snp.remakeConstraints { (make) in
            make.left.equalTo(self.label.snp.right)
            make.right.equalTo(self).offset(-self.rightPadding)
            make.top.bottom.equalTo(self)
        }
    }

    open override func initViews() {
        self.backgroundColor = UIColor.white

        self.requiredLabel.font = UIFont.systemFont(ofSize: 14)
        self.requiredLabel.textColor = UIColor.red
        self.requiredLabel.text = "*"
        self.addSubview(self.requiredLabel)

        self.label.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(self.label)

        self.textField.font = UIFont.systemFont(ofSize: 14)
        self.textField.clearButtonMode = .whileEditing
        self.addSubview(self.textField)

        super.initViews()
    }
}
