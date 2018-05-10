import UIKit
import SnapKit

open class TitleSwitch: TitleLayout {
    
    open var onTintColor: UIColor? {
        didSet {
            self.switchView.onTintColor = self.onTintColor
        }
    }
    
    open var isSelected: Bool = false {
        didSet {
            self.switchView.setOn(self.isSelected, animated: false)
        }
    }

    open var onSelectChanged: ((Bool) -> Void)?
    
    let switchView = UISwitch()
    
    open override func updateConstraints() {
        super.updateConstraints()
        self.switchView.snp.remakeConstraints { (make) in
            make.right.equalTo(self).offset(-self.rightPadding)
            make.centerY.equalTo(self)
            make.size.greaterThanOrEqualTo(0)
        }
    }

    open override func initViews() {
        super.initViews()
        self.switchView.addTarget(self, action: #selector(onSwitchValueChanged), for: UIControlEvents.valueChanged)
        self.addSubview(self.switchView)
    }

    @objc open func onSwitchValueChanged() {
        if let callback = self.onSelectChanged {
            callback(self.switchView.isOn)
        }
    }
}
