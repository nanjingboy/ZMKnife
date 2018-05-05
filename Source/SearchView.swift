import UIKit
import SpriteKit

open class SearchView: UIView, UITextFieldDelegate {

    open let imageView = UIImageView()
    open let textField = UITextField()

    open var onSearch: ((String?) -> Void)?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }

    open override func updateConstraints() {
        super.updateConstraints()
        self.imageView.snp.remakeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.centerY.equalTo(self)
            make.size.equalTo(14)
        }
        self.textField.snp.remakeConstraints { (make) in
            make.left.equalTo(self.imageView.snp.right).offset(4)
            make.right.top.bottom.equalTo(self)
        }
    }

    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    open func textFieldDidEndEditing(_ textField: UITextField) {
        if let callback = self.onSearch {
            callback(textField.text)
        }
    }

    open func initViews() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00).cgColor
        self.clipsToBounds = true

        self.imageView.image = Utils.image("search", classType: self)
        self.addSubview(self.imageView)

        self.textField.font = UIFont.systemFont(ofSize: 14)
        self.textField.clearButtonMode = UITextFieldViewMode.whileEditing
        self.textField.returnKeyType = .search
        self.textField.delegate = self
        self.addSubview(self.textField)
    }
}
