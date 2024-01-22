import Foundation
import UIKit

public final class TicketRouter : TicketModuleInterface {
    public init(){}
    public func createModule(ticketId:String) -> UIViewController {
        let view = TicketViewController()
        let presenter = TicketPresenter(view: view)
        presenter.id = ticketId
        view.presenter = presenter
        return view
    }
}
