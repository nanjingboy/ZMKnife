import UIKit
import SnapKit

open class TitleAndValueTextView: TitleLayout {

    open let valueLabel = PaddingLabel()

    open override func updateConstraints() {
        super.updateConstraints()
        self.updateValueLabelConstraints()
    }

    open func updateValueLabelConstraints() {
        self.valueLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right)
            make.right.equalTo(self).offset(-rightPadding)
            make.top.equalTo(self).offset(self.valueLabel.padding.top)
            make.bottom.equalTo(self).offset(-self.valueLabel.padding.bottom)
        }
    }

    override open func initViews() {
        self.valueLabel.numberOfLines = 0
        self.valueLabel.font = UIFont.systemFont(ofSize: 14)
        self.valueLabel.textAlignment = NSTextAlignment.right
        self.addSubview(self.valueLabel)
        super.initViews()
    }
}
