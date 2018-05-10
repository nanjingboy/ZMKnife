import UIKit
import SnapKit

open class TitleTextField: TitleLayout {

    open let textField = UITextField()

    open override func updateConstraints() {
        super.updateConstraints()
        self.textField.snp.remakeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right)
            make.right.equalTo(self).offset(-self.rightPadding)
            make.top.bottom.equalTo(self)
        }
    }

    open override func initViews() {
        super.initViews()
        self.textField.font = UIFont.systemFont(ofSize: 14)
        self.textField.clearButtonMode = .whileEditing
        self.addSubview(self.textField)
    }
}
