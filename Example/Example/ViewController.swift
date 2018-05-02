import UIKit
import ZMKnife
import SnapKit

class ViewController: UIViewController {

    let titleAndValueTextViewLabel = PaddingLabel()
    let titleAndValueTextView = TitleAndValueTextView()

    let rightIconTitleAndValueTextViewLabel = PaddingLabel()
    let rightIconTitleAndValueTextView = RightIconTitleAndValueTextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
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
        self.titleAndValueTextView.title = "Name"
        self.titleAndValueTextView.value = "Tom.Huang"
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
        self.rightIconTitleAndValueTextView.title = "Name"
        self.rightIconTitleAndValueTextView.value = "Tom.Huang"
        self.view.addSubview(self.rightIconTitleAndValueTextView)
        self.rightIconTitleAndValueTextView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.rightIconTitleAndValueTextViewLabel.snp.bottom)
            make.height.equalTo(40)
        }
    }
}

