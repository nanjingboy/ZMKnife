import UIKit
import Foundation

struct Utils {

    static func image(_ imageName: String, classType: AnyObject) -> UIImage? {
        if let bundlePath = Bundle(for: type(of: classType)).resourcePath?.appending("/ZMKnife.bundle") {
            return UIImage(named: imageName, in: Bundle(path: bundlePath), compatibleWith: nil)
        }
        return nil
    }
}
