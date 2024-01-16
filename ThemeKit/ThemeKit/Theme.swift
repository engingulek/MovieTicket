

import Foundation
import UIKit

public struct Theme {
  public let themeColor : ThemeColor
    public let themeFont : ThemeFont
}

public struct ThemeColor {
    public  let primaryBackground: String
    public  let secondaryBack : String
    public  let thirdBack : String
    public  let primaryLabel:String
    public  let secondaryLabel:String
    public let thirdLabel :String
    public let textFieldBackColor : String
    public let alertTextFieldBorderColor:String
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
            primaryBackground: "#211921",
            secondaryBack: "#382C3E",
            thirdBack: "#7C44C2",
            primaryLabel: "#FEFFFF",
            secondaryLabel: "#998396",
            thirdLabel: "#000000",
            textFieldBackColor: "#808080", 
            alertTextFieldBorderColor: "#FF0000"),
              
            themeFont: ThemeFont(
                primaryFont: .systemFont(ofSize: FontSize.primarySize),
                secondaryFont: .systemFont(ofSize: FontSize.secondarySizie),
                thirdFont: .systemFont(ofSize: FontSize.thirdLabel),
                cellLabelFont: .systemFont(ofSize: FontSize.cellLabel),
                cellSubLabelFont: .systemFont(ofSize: FontSize.cellSubLabel)))
    }
}
