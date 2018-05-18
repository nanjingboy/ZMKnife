import UIKit

open class BorderBottomView: UIView {

    open var bottomBorderColor: UIColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00) {
        didSet {
            setNeedsDisplay()
        }
    }

    let bottomBorderLayer = CALayer()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }

    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        if !(self.layer.sublayers?.contains(self.bottomBorderLayer) ?? false) {
            self.layer.addSublayer(self.bottomBorderLayer)
        }
        self.bottomBorderLayer.backgroundColor = self.bottomBorderColor.cgColor
        self.bottomBorderLayer.frame = CGRect(x: 0, y: self.bounds.height - 1, width: self.bounds.width, height: 1)
    }

    open func initViews() {
    }
}
