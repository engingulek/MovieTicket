

import Foundation
import UIKit

public struct Theme {
  public let themeColor : ThemeColor
}

public struct ThemeColor {
    public  let primaryBackground: UIColor
    public  let secondaryBack : UIColor
    public  let thirdBack : UIColor
    public  let primaryLabel:UIColor
    public  let secondaryLabel:UIColor
}


struct ThemeFont {
    
}

extension Theme {
    public static var theme : Theme{
        Theme(themeColor: ThemeColor(
            primaryBackground: UIColor(resource: .primaryBack),
            secondaryBack: UIColor(resource: .secondaryBack),
            thirdBack: UIColor(resource: .thirdBack),
            primaryLabel: UIColor(resource: .primaryColorLabel),
            secondaryLabel: UIColor(resource: .secondaryColorLabel)))
    }
}
