import Foundation
import UIKit

protocol PaymenPageRouterInterface {
    
}


public class PaymenPageRouter : PaymentPageModuleInterface {
    public init(){}
    public func createModule() -> UIViewController {
        let view = PaymentPageViewController()
        return view
    }
}
