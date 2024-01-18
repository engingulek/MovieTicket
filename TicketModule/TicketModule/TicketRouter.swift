import Foundation
import UIKit


public final class TicketRouter : TicketModuleInterface {
    public init(){}
    public func createModule(ticketId:String) -> UIViewController {
        let view = TicketViewController()
        print(ticketId)
        return view
    }
}
