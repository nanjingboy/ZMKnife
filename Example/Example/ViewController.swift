import UIKit
import ZMKnife
import SnapKit

class ViewController: UIViewController {

    let titleAndValueTextViewDemoLabel = PaddingLabel()
    let titleAndValueTextView = TitleAndValueTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "ZMKnife Demos"

        self.titleAndValueTextViewDemoLabel.padding = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.titleAndValueTextViewDemoLabel.backgroundColor = UIColor.lightGray
        self.titleAndValueTextViewDemoLabel.font = UIFont.systemFont(ofSize: 14)
        self.titleAndValueTextViewDemoLabel.text = "TitleAndValueTextView Demo"
        self.view.addSubview(self.titleAndValueTextViewDemoLabel)
        self.titleAndValueTextViewDemoLabel.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.view)
            make.height.greaterThanOrEqualTo(30)
        }
        self.titleAndValueTextView.title = "Name"
        self.titleAndValueTextView.value = "Tom.Huang"
        self.view.addSubview(self.titleAndValueTextView)
        self.titleAndValueTextView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.titleAndValueTextViewDemoLabel.snp.bottom)
            make.height.equalTo(40)
        }
    }
}

