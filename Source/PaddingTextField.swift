import UIKit
import SpriteKit

public class PaddingTextField: UITextField {
    
    public var bottomBorderColor: UIColor? {
        didSet {
            self.borderBottom.backgroundColor = self.bottomBorderColor
        }
    }

    public var padding: UIEdgeInsets = UIEdgeInsets.zero

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
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }

    func initViews() {
        self.borderBottom.backgroundColor = self.backgroundColor
        self.addSubview(self.borderBottom)
    }
}
