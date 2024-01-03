import Foundation
import UIKit
import ThemeKit

protocol PaymentPageViewControllerInterface : AnyObject {
    
}


final class PaymentPageViewController : UIViewController {
    private lazy var paymetPageView = PaymentPageView()
    override func loadView() {
        view = paymetPageView
    }
    
    override func viewDidLoad() {
        view.backgroundColor =  Theme.theme.themeColor.primaryBackground
    }
}
