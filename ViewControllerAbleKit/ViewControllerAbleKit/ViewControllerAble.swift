import UIKit
import CommenUIKit

//MARK: - UIViewAble
public protocol UIViewAble {
    func setBackColorAble(color:String)
}

extension UIViewAble where Self : UIViewController {
    public func setBackColorAble(color:String){
        view.backgroundColor = UIColor(hex:color)
    }
}

//MARK: - SegueAble
public protocol SegueAble {
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
}

extension SegueAble  where Self : UIViewController{
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
}

//MARK: - NavConUIAble
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

//MARK: - AlertMessageAble
public protocol AlertMessageAble {
    func createAlertMesssage(title:String,message:String,actionTitle:String)
   
}

extension AlertMessageAble  where Self : UIViewController {
    public  func createAlertMesssage(
        title:String,
        message:String,
        actionTitle:String){
            
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: actionTitle, style: .default))
        self.present(alert, animated: true)
        
    }
}


