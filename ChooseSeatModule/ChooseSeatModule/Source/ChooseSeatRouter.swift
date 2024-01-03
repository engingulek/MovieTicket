import Foundation
import UIKit
import PaymentPageModule
import DependenyKit
protocol ChooseSeatRouterInterface {
    func toPaymentPage(view:ChooseSeatViewControllerInterface?)
}

public final class ChooseSeatRouter : ChooseSeatModuleInterface {
    public init(){}
    public func createModule()-> UIViewController {
        let view = ChooseSeatViewController()
        let router = ChooseSeatRouter()
        let presenter = ChooseSeatPresenter(view: view,
                                    router: router)
        view.presenter = presenter
        return view
    }
    
    
}


extension ChooseSeatRouter : ChooseSeatRouterInterface {
    func toPaymentPage(view: ChooseSeatViewControllerInterface?) {
        @Dependency var paymentPageModule : PaymentPageModuleInterface
        let viewController = paymentPageModule.createModule()
        view?.pushViewControllerAble(
            viewController,
            animated: true)
    }
    
  
    
    
}
