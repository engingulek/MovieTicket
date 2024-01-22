
import Foundation
@testable import SearchMovie
import UIKit.UIViewController
class MockSearchMovieController : SearchMovieViewControllerInterface {
    
    
    var invokedprepareTableView = false
    var invokedprepareTableViewount = 0
    func prepareTableView() {
         invokedprepareTableView = true
         invokedprepareTableViewount += 1
    }
    
    var invokedrelaodTableView = false
    var invokedrelaodTableViewCount = 0
    func relaodTableView() {
        invokedrelaodTableView = true
        invokedrelaodTableViewCount += 1
    }
    
    var invokedsearchTextfieldText = false
    var invokedsearchTextfieldTextCount = 0
    var invokedsearchTextfieldTextParameters : (text:String,Void)?
    func searchTextfieldText(searchText: String) {
         invokedsearchTextfieldText = true
         invokedsearchTextfieldTextCount += 1
         invokedsearchTextfieldTextParameters = (text:searchText,())
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
