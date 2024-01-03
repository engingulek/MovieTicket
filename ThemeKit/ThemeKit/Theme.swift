

import Foundation
import UIKit

public struct Theme {
  public let themeColor : ThemeColor
    public let themeFont : ThemeFont
}

public struct ThemeColor {
    public  let primaryBackground: UIColor
    public  let secondaryBack : UIColor
    public  let thirdBack : UIColor
    public  let primaryLabel:UIColor
    public  let secondaryLabel:UIColor
    public let thirdLabel : UIColor
    public let textFieldBackColor : UIColor
}

public struct ThemeFont {
    public let primaryFont: UIFont
    public let secondaryFont: UIFont
    public let thirdFont : UIFont
    public let cellLabelFont: UIFont
    public let cellSubLabelFont: UIFont
}



extension Theme {
    public static var theme : Theme{
        Theme(themeColor: ThemeColor(
            primaryBackground: UIColor(resource: .primaryBack),
            secondaryBack: UIColor(resource: .secondaryBack),
            thirdBack: UIColor(resource: .thirdBack),
            primaryLabel: UIColor(resource: .primaryColorLabel),
            secondaryLabel: UIColor(resource: .secondaryColorLabel),
            thirdLabel: UIColor.black,
            textFieldBackColor: UIColor.gray.withAlphaComponent(0.5)), 
              
            themeFont: ThemeFont(
                primaryFont: .systemFont(ofSize: FontSize.primarySize),
                secondaryFont: .systemFont(ofSize: FontSize.secondarySizie),
                thirdFont: .systemFont(ofSize: FontSize.thirdLabel),
                cellLabelFont: .systemFont(ofSize: FontSize.cellLabel),
                cellSubLabelFont: .systemFont(ofSize: FontSize.cellSubLabel)))
    }
}
