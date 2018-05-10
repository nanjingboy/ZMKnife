import UIKit
import ZMKnife
import SnapKit
import Toast_Swift

class ViewController: UIViewController {

    let titleAndValueTextViewLabel = PaddingLabel()
    let titleAndValueTextView = TitleAndValueTextView()

    let rightIconTitleAndValueTextViewLabel = PaddingLabel()
    let rightIconTitleAndValueTextView = RightIconTitleAndValueTextView()

    let paddingTextFieldLabel = PaddingLabel()
    let paddingTextField = PaddingTextField()
    
    let searchViewLabel = PaddingLabel()
    let searchView = SearchView()

    let titleTextFieldLabel = PaddingLabel()
    let titleTextField = TitleTextField()

    let paddingTextViewLabel = PaddingLabel()
    let paddingTextView = PaddingTextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "ZMKnife Demos"

        self.titleAndValueTextViewLabel.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.titleAndValueTextViewLabel.backgroundColor = UIColor.lightGray
        self.titleAndValueTextViewLabel.font = UIFont.systemFont(ofSize: 14)
        self.titleAndValueTextViewLabel.text = "TitleAndValueTextView Demo"
        self.view.addSubview(self.titleAndValueTextViewLabel)
        self.titleAndValueTextViewLabel.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.view)
            make.height.greaterThanOrEqualTo(30)
        }

        self.titleAndValueTextView.titleLabel.text = "Name"
        self.titleAndValueTextView.valueLabel.text = "Tom.Huang"
        self.view.addSubview(self.titleAndValueTextView)
        self.titleAndValueTextView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.titleAndValueTextViewLabel.snp.bottom)
            make.height.equalTo(40)
        }

        self.rightIconTitleAndValueTextViewLabel.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.rightIconTitleAndValueTextViewLabel.backgroundColor = UIColor.lightGray
        self.rightIconTitleAndValueTextViewLabel.font = UIFont.systemFont(ofSize: 14)
        self.rightIconTitleAndValueTextViewLabel.text = "RightIconTitleAndValueTextView Demo"
        self.view.addSubview(self.rightIconTitleAndValueTextViewLabel)
        self.rightIconTitleAndValueTextViewLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.titleAndValueTextView.snp.bottom)
            make.height.greaterThanOrEqualTo(30)
        }
        self.rightIconTitleAndValueTextView.titleLabel.text = "Name"
        self.rightIconTitleAndValueTextView.valueLabel.text = "Tom.Huang"
        self.view.addSubview(self.rightIconTitleAndValueTextView)
        self.rightIconTitleAndValueTextView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.rightIconTitleAndValueTextViewLabel.snp.bottom)
            make.height.equalTo(40)
        }

        self.paddingTextFieldLabel.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.paddingTextFieldLabel.backgroundColor = UIColor.lightGray
        self.paddingTextFieldLabel.font = UIFont.systemFont(ofSize: 14)
        self.paddingTextFieldLabel.text = "PaddingTextField Demo"
        self.view.addSubview(self.paddingTextFieldLabel)
        self.paddingTextFieldLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.rightIconTitleAndValueTextView.snp.bottom)
            make.height.greaterThanOrEqualTo(30)
        }
        self.paddingTextField.placeholder = "padding text field"
        self.paddingTextField.backgroundColor = UIColor.white
        self.paddingTextField.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.paddingTextField.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(self.paddingTextField)
        self.paddingTextField.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.paddingTextFieldLabel.snp.bottom)
            make.height.equalTo(40)
        }

        self.searchViewLabel.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.searchViewLabel.backgroundColor = UIColor.lightGray
        self.searchViewLabel.font = UIFont.systemFont(ofSize: 14)
        self.searchViewLabel.text = "SearchView Demo"
        self.view.addSubview(self.searchViewLabel)
        self.searchViewLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.paddingTextField.snp.bottom)
            make.height.greaterThanOrEqualTo(30)
        }
        self.searchView.textField.placeholder = "Search..."
        self.view.addSubview(self.searchView)
        self.searchView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(4)
            make.right.equalTo(self.view).offset(-4)
            make.top.equalTo(self.searchViewLabel.snp.bottom).offset(4)
            make.height.equalTo(40)
        }
        self.searchView.onSearch = { [unowned self] (keyword) in
            self.view.makeToast("Keyword: \(keyword!)")
        }

        self.titleTextFieldLabel.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.titleTextFieldLabel.backgroundColor = UIColor.lightGray
        self.titleTextFieldLabel.font = UIFont.systemFont(ofSize: 14)
        self.titleTextFieldLabel.text = "TitleTextField Demo"
        self.view.addSubview(self.titleTextFieldLabel)
        self.titleTextFieldLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.searchView.snp.bottom).offset(4)
            make.height.greaterThanOrEqualTo(30)
        }
        self.titleTextField.isRequired = true
        self.titleTextField.titleLabel.text = "Name"
        self.titleTextField.textField.placeholder = "please type your name"
        self.view.addSubview(self.titleTextField)
        self.titleTextField.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.titleTextFieldLabel.snp.bottom)
            make.height.equalTo(40)
        }

        self.paddingTextViewLabel.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.paddingTextViewLabel.backgroundColor = UIColor.lightGray
        self.paddingTextViewLabel.font = UIFont.systemFont(ofSize: 14)
        self.paddingTextViewLabel.text = "PaddingTextView Demo"
        self.view.addSubview(self.paddingTextViewLabel)
        self.paddingTextViewLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.titleTextField.snp.bottom)
            make.height.greaterThanOrEqualTo(30)
        }
        self.paddingTextView.placeholder = "please type..."
        self.paddingTextView.font = UIFont.systemFont(ofSize: 14)
        self.paddingTextView.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.view.addSubview(self.paddingTextView)
        self.paddingTextView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.paddingTextViewLabel.snp.bottom)
            make.height.equalTo(50)
        }
    }
}

