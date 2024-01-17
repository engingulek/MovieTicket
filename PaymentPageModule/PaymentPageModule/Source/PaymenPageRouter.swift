import Foundation
import UIKit
import DependenyKit
import TicketModule
protocol PaymenPageRouterInterface {
    func toTicket(view:PaymentPageViewControllerInterface?)
}


public class PaymenPageRouter : PaymentPageModuleInterface {
    public init(){}
    public func createModule(ticketInfo: [String : Any]) -> UIViewController {
        let view = PaymentPageViewController()
        let router = PaymenPageRouter()
        let presenter = PaymentPagePresenter(view: view, router: router)
        print("Paymet Routerr : \(ticketInfo["seats"])")
        view.presenter = presenter
        return view
    }
}

extension PaymenPageRouter : PaymenPageRouterInterface {
    func toTicket(view:PaymentPageViewControllerInterface?) {
        @Dependency var ticketModule : TicketModuleInterface
        let viewController = ticketModule.createModule()
        view?.pushViewControllerAble(
            viewController,
            animated: true)
    }
}
