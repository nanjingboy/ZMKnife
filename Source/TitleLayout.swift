import UIKit
import SnapKit

open class TitleLayout: BorderBottomView {
    
    open var titleLabelWidth: CGFloat?
    open var isRequired: Bool = false
    open var leftPadding: CGFloat = 16
    open var rightPadding: CGFloat = 16

    open let titleLabel = UILabel()
    
    let requiredLabel = UILabel()
    
    open override func updateConstraints() {
        super.updateConstraints()
        var titleLabelLeftPadding: CGFloat
        if self.isRequired {
            self.requiredLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(self.leftPadding)
                make.width.equalTo(6)
                make.top.bottom.equalTo(self)
            }
            titleLabelLeftPadding = self.leftPadding + 8
        } else {
            titleLabelLeftPadding = self.leftPadding
        }
        if let titleLabelWidth = self.titleLabelWidth {
            self.titleLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(titleLabelLeftPadding)
                make.width.equalTo(titleLabelWidth)
                make.top.bottom.equalTo(self)
            }
        } else {
            self.titleLabel.snp.remakeConstraints { (make) in
                make.left.equalTo(self).offset(titleLabelLeftPadding)
                make.right.equalTo(self.snp.centerX)
                make.top.bottom.equalTo(self)
            }
        }
    }
    
    open override func initViews() {
        self.backgroundColor = UIColor.white
    
        self.requiredLabel.font = UIFont.systemFont(ofSize: 14)
        self.requiredLabel.textColor = UIColor.red
        self.requiredLabel.text = "*"
        self.addSubview(self.requiredLabel)
        
        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(self.titleLabel)

        super.initViews()
    }
}
