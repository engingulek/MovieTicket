import Foundation
import UIKit
import DependenyKit
import TicketModule
import ModelKit
protocol PaymenPageRouterInterface {
    func toTicket(view:PaymentPageViewControllerInterface?,ticketId:String)
}


public class PaymenPageRouter : PaymentPageModuleInterface {
    public init(){}
    public func createModule(createdTicket:CreatedTicketInfo) -> UIViewController {
        let view = PaymentPageViewController()
        let router = PaymenPageRouter()
        let presenter = PaymentPagePresenter(view: view, router: router)
        presenter.createdTicket = createdTicket
        view.presenter = presenter
        return view
    }
}

extension PaymenPageRouter : PaymenPageRouterInterface {
    func toTicket(view:PaymentPageViewControllerInterface?,ticketId:String) {
        @Dependency var ticketModule : TicketModuleInterface
        print("Router Payment \(ticketId)")
        let viewController = ticketModule.createModule(ticketId:ticketId)
        view?.pushViewControllerAble(
            viewController,
            animated: true)
    }
}
