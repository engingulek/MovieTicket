

import Foundation
import UIKit

public class UIScreenView {
    
   public static let shared = UIScreenView()
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}
