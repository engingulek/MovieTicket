import UIKit

public protocol UIViewAble {
    func setBackColorAble(color:UIColor)
}

extension UIViewAble where Self : UIViewController {
    public func setBackColorAble(color:UIColor){
        view.backgroundColor = color
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
    func changeNavBarColor(color:UIColor)
    func changeTintColor(color:UIColor)
    func changeTitle(title:String)
    func navigationBarHidden(isHidden:Bool)
}

extension NavConUIAble where Self :  UIViewController{
    public func changeNavBarColor(color:UIColor){
        navigationController?.navigationBar.barTintColor = color
    }
    
    public func changeTintColor(color:UIColor){
        navigationController?.navigationBar.tintColor = color
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: color
        ]
    }
    
    public func changeTitle(title:String) {
        navigationItem.title = title
    }
    
    public func navigationBarHidden(isHidden:Bool){
        navigationController?.navigationBar.isHidden = isHidden
    }
}


