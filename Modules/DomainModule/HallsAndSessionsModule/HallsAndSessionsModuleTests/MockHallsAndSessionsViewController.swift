import Foundation
@testable import HallsAndSessionsModule
import UIKit.UIViewController

class MockHallsAndSessionsViewController : HallsAndSessionsViewControllerInterface{
  
    var invokedprepareCollectionView = false
    var invokedprepareCollectionViewCount = 0
    func prepareCollectionView() {
         invokedprepareCollectionView = true
         invokedprepareCollectionViewCount += 1
    }
    
    var invokedreloadCollectionView = false
    var invokedreloadCollectionViewViewCount = 0
    func reloadCollectionView() {
         invokedreloadCollectionView = true
         invokedreloadCollectionViewViewCount += 1
    }
    
    var invokedprepareTableView = false
    var invokedprepareTableViewount = 0
    func prepareTableView() {
         invokedprepareTableView = true
         invokedprepareTableViewount += 1
    }
    
    var invokedrelaodTableView = false
    var invokedrelaodTableViewCount = 0
    func reloadTableView() {
        invokedrelaodTableView = true
        invokedrelaodTableViewCount += 1
    }
    
    var invokedstartAnimatigIndicator : Bool = false
    var invokedstartAnimatigIndicatorCount = 0
    func startAnimatigIndicator() {
        invokedstartAnimatigIndicator = true
        invokedstartAnimatigIndicatorCount += 1
    }
    
    var invokedstopAnimatingIndicator : Bool = false
    var invokedstopAnimatingIndicatorCount = 0
    func stopAnimatingIndicator() {
        invokedstopAnimatingIndicator = true
        invokedstopAnimatingIndicatorCount += 1
    }
    
    var invokedmessageText : Bool = false
    var invokedmessageTextCount = 0
    var invokedmessageTextParameters : (text:String,Void)?
    func messageText(text: String) {
        invokedmessageText = true
        invokedmessageTextCount += 1
        invokedmessageTextParameters = (text:text,())
    }
    
    var invokedchangeNavBarColor = false
    var invokedchangeNavBarColorCount = 0
    var invokedchangeNavBarColorParameters : (color:String,Void)?
    func changeNavBarColor(color: String) {
        invokedchangeNavBarColor = true
        invokedchangeNavBarColorCount += 1
        invokedchangeNavBarColorParameters = (color:color,())
    }
    
    
    var invokedchangeTintColor = false
    var invokedchangeTintColorCount = 0
    var invokedchangeTintColorParameters : (color:String,Void)?
    func changeTintColor(color: String) {
        invokedchangeTintColor = true
        invokedchangeTintColorCount += 1
        invokedchangeTintColorParameters = (color:color,())
    }
    
    var invokedchangeTitle = false
    var invokedchangeTitleCount = 0
    var invokedchangeTitleParameters : (title:String,Void)?
    func changeTitle(title: String) {
         invokedchangeTitle = true
         invokedchangeTitleCount += 1
         invokedchangeTitleParameters = (title:title,())
    }
    
    var invokednavigationBarHidden = false
    var invokednavigationBarHiddenCount = 0
    var invokednavigationBarHiddenParameters : (isHidden:Bool,Void)?
    func navigationBarHidden(isHidden: Bool) {
         invokednavigationBarHidden = true
         invokednavigationBarHiddenCount += 1
         invokednavigationBarHiddenParameters = (isHidden:isHidden,())
    }
    
    var invokedSetBackColorAble = false
    var invokedSetBackColorAbleCount = 0
    var invokedSetBackColorAbleParameters : (color:String,Void)?
    func setBackColorAble(color: String) {
        invokedSetBackColorAble = true
        invokedSetBackColorAbleCount += 1
        invokedSetBackColorAbleParameters = (color:color,())
    }
    
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
        
    }

}


