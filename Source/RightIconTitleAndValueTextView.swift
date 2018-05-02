import UIKit
import SnapKit
import Foundation

public class RightIconTitleAndValueTextView : TitleAndValueTextView {

    public var rightIcon: UIImage? {
        didSet {
            self.rightIconImageView.image = self.rightIcon
        }
    }

    public var rightIconWidth: CGFloat = 6
    public var rightIconHeight: CGFloat = 12
    public var rightIconLeftMargin: CGFloat = 4
    
    public var onClickedListener: (() -> Void)?

    let rightIconImageView = UIImageView()

    public override func updateConstraints() {
        super.updateConstraints()
        self.rightIconImageView.snp.remakeConstraints { (make) in
            make.right.equalTo(self).offset(-self.rightPadding)
            make.width.equalTo(self.rightIconWidth)
            make.centerY.equalTo(self)
            make.height.equalTo(self.rightIconHeight)
        }
    }

    override func updateValueLabelConstraints() {
        self.valueLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right)
            make.right.equalTo(self).offset(-(self.rightPadding + self.rightIconWidth + self.rightIconLeftMargin))
            make.top.bottom.equalTo(self)
        }
    }

    override func initViews() {
        super.initViews()
        self.rightIconImageView.image = Utils.image("arrow_right", classType: self)
        self.addSubview(self.rightIconImageView)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClicked)))
    }

    @objc func onClicked() {
        if let callback = self.onClickedListener {
            callback()
        }
    }
}
