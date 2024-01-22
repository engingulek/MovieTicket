
import Foundation
import UIKit

struct FontSize {
    private init() {}
    /// is 30
    static let primarySize: CGFloat = 30
    /// is 25
    static let secondarySizie: CGFloat = 25
    /// is 20
    static let cellLabel: CGFloat = 20
    /// is 15
    static let cellSubLabel: CGFloat = 15
    /// is 10
    static let thirdLabel: CGFloat = 10
}

extension UIFont {
   public var boldVersion: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: .zero) /// 0 is keep to orjinal size
    }
}
