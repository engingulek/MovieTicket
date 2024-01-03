
import Foundation
import UIKit
protocol TicketListRouterInterface {
    
}

public final class TicletListRouter : TicketListModuleInterface{
    public init(){}
    public func createModule() -> UITableViewController {
        let view = TicketListTableViewController()
        return view
    }
    
    
}
