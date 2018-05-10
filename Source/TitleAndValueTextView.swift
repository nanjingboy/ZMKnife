import UIKit
import SnapKit

open class TitleAndValueTextView: TitleLayout {

    open let valueLabel = PlaceholderLabel()

    open override func updateConstraints() {
        super.updateConstraints()
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
        self.valueLabel.font = UIFont.systemFont(ofSize: 14)
        self.valueLabel.textAlignment = NSTextAlignment.right
        self.addSubview(self.valueLabel)
        super.initViews()
    }
}
