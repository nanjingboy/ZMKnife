import UIKit
import UITextView_Placeholder

open class PaddingTextView: UITextView {

    open var padding: UIEdgeInsets = UIEdgeInsets.zero

    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.textContainerInset = self.padding
    }
}
