
import Foundation
import UIKit
protocol HallsAndSessionsRouterInterface {
    
}

public final class HallsAndSessionsRouter : HallsAndSessionsModuleInterface {
    
    public init(){}
    
   public func createModule() -> UIViewController {
        let view = HallsAndSessionsViewController()
       return view
    }
    
    
}
