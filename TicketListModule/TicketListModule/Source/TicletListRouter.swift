
import Foundation
import UIKit
import DependenyKit
import TicketModule

protocol TicketListRouterInterface {
    func toTicketView(view:TicketListViewControllerInterface?)
}

public final class TicletListRouter : TicketListModuleInterface{
    public init(){}
    public func createModule() -> UITableViewController {
        let view = TicketListTableViewController()
        let router = TicletListRouter()
        let presenter = TicketListPresenter(view: view,
                                     router: router)
        view.presenter = presenter
        return view
    }
}

extension TicletListRouter : TicketListRouterInterface {
    func toTicketView(view:TicketListViewControllerInterface?) {
        @Dependency var ticketModuleInterface : TicketModuleInterface
        let viewController = ticketModuleInterface.createModule()
        view?.pushViewControllerAble(
            viewController,
            animated: true)
    }
}
