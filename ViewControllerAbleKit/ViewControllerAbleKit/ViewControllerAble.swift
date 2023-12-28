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
public protocol NavConAble {
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
}

extension NavConAble  where Self : UIViewController{
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
}


