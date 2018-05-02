import UIKit
import SnapKit

public class BorderBottomView: UIView {

    public var borderColor: UIColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00) {
        didSet {
            self.borderBottom.backgroundColor = self.borderColor
        }
    }

    let borderBottom = UIView()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }

    public override func updateConstraints() {
        super.updateConstraints()
        self.borderBottom.snp.remakeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.snp.bottom).offset(-1)
            make.height.equalTo(1)
        }
    }

    func initViews() {
        self.borderBottom.backgroundColor = self.borderColor
        self.addSubview(self.borderBottom)
    }
}
