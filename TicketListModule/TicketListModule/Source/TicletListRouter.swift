
import Foundation
import UIKit
protocol TicketListRouterInterface {
    func toTicketView()
}

public final class TicletListRouter : TicketListModuleInterface{
    public init(){}
    public func createModule() -> UITableViewController {
        let view = TicketListTableViewController()
        return view
    }
}

extension TicletListRouter : TicketListRouterInterface {
    func toTicketView() {
        
    } 
}
