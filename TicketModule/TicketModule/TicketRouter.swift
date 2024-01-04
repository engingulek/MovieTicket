import Foundation
import UIKit


public final class TicketRouter : TicketModuleInterface {
    public init(){}
    public func createModule() -> UIViewController {
        let view = TicketViewController()
        return view
    }

}
