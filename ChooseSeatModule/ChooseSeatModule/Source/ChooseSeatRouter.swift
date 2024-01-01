import Foundation
import UIKit

protocol ChooseSeatRouterInterface {
    
}

public final class ChooseSeatRouter : ChooseSeatModuleInterface {
    public init(){}
    public func createModule()-> UIViewController {
        let view = ChooseSeatViewController()
        return view
    }
    
    
}


extension ChooseSeatRouter : ChooseSeatRouterInterface {
    
}
