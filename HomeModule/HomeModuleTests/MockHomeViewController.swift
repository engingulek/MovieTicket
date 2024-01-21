import Foundation
import UIKit.UIViewController
@testable import HomeModule
class MockHomeViewController :  HomeViewControllerInterface {
    
    var invokedPrapareCollectionView = false
    var invokedPrepareCollectionViewCount = 0
    func prepareCollectionView() {
        invokedPrapareCollectionView = true
        invokedPrepareCollectionViewCount += 1
    }
    
    var invokedReloadCollectionView = false
    var invokedReloadCollectionViewCount = 0
    func reloadCollectionView() {
        invokedReloadCollectionView = true
        invokedReloadCollectionViewCount += 1
    }
    
    
    var invokedtextFieldAction = false
    var invokedtextFieldActionCount = 0
    var invokedtextFieldActionParameters : (text:String,Void)?
    func textFieldAction(text:String) {
        invokedtextFieldAction = true
        invokedtextFieldActionCount += 1
        invokedtextFieldActionParameters = (text:text,())
    }
    
    var invokedSetBackColorAble = false
    var invokedSetBackColorAbleCount = 0
    var invokedSetBackColorAbleParameters : (color:String,Void)?
    func setBackColorAble(color: String) {
        invokedSetBackColorAble = true
        invokedSetBackColorAbleCount += 1
        invokedSetBackColorAbleParameters = (color:color,())
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
    
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
        
    }
    
    
}
