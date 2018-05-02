import UIKit
import SnapKit
import Foundation

open class RightIconTitleAndValueTextView : TitleAndValueTextView {

    open var rightIcon: UIImage? {
        didSet {
            self.rightIconImageView.image = self.rightIcon
        }
    }

    open var rightIconWidth: CGFloat = 6
    open var rightIconHeight: CGFloat = 12
    open var rightIconLeftMargin: CGFloat = 4
    
    open var onClickedListener: (() -> Void)?

    let rightIconImageView = UIImageView()

    open override func updateConstraints() {
        super.updateConstraints()
        self.rightIconImageView.snp.remakeConstraints { (make) in
            make.right.equalTo(self).offset(-self.rightPadding)
            make.width.equalTo(self.rightIconWidth)
            make.centerY.equalTo(self)
            make.height.equalTo(self.rightIconHeight)
        }
    }

    open override func updateValueLabelConstraints() {
        self.valueLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right)
            make.right.equalTo(self).offset(-(self.rightPadding + self.rightIconWidth + self.rightIconLeftMargin))
            make.top.bottom.equalTo(self)
        }
    }

   open override func initViews() {
        super.initViews()
        self.rightIconImageView.image = Utils.image("arrow_right", classType: self)
        self.addSubview(self.rightIconImageView)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClicked)))
    }

    @objc open func onClicked() {
        if let callback = self.onClickedListener {
            callback()
        }
    }
}
