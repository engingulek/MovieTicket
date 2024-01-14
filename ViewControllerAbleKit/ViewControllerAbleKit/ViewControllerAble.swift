import UIKit
import CommenUIKit
public protocol UIViewAble {
    func setBackColorAble(color:String)
}

extension UIViewAble where Self : UIViewController {
    public func setBackColorAble(color:String){
        view.backgroundColor = UIColor(hex:color)
    }
}

//MARK: - NavConAble
public protocol SegueAble {
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
}

extension SegueAble  where Self : UIViewController{
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
}


public protocol NavConUIAble {
    func changeNavBarColor(color:String)
    func changeTintColor(color:String)
    func changeTitle(title:String)
    func navigationBarHidden(isHidden:Bool)
}

extension NavConUIAble where Self :  UIViewController{
    public func changeNavBarColor(color:String){
        navigationController?.navigationBar.barTintColor = UIColor(hex:color)
    }
    
    public func changeTintColor(color:String){
        navigationController?.navigationBar.tintColor = UIColor(hex:color)
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(hex:color) ?? UIColor.white
        ]
    }
    
    public func changeTitle(title:String) {
        navigationItem.title = title
    }
    
    public func navigationBarHidden(isHidden:Bool){
        navigationController?.navigationBar.isHidden = isHidden
    }
}


