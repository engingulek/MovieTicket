
import Foundation
import UIKit
import DependenyKit
import ChooseSeatModule
protocol HallsAndSessionsRouterInterface {
    func toChooseSeat(view:HallsAndSessionsViewControllerInterface?)
}

public final class HallsAndSessionsRouter : HallsAndSessionsModuleInterface {
    
    public init(){}
    
   public func createModule() -> UIViewController {
        let view = HallsAndSessionsViewController()
       let router = HallsAndSessionsRouter()
       let presenter = HallsAndSessionsPresenter(view: view, router: router)
       view.presenter = presenter
       return view
    }
}


extension HallsAndSessionsRouter : HallsAndSessionsRouterInterface {
    func toChooseSeat(view: HallsAndSessionsViewControllerInterface?) {
        @Dependency var chooseSeatModule : ChooseSeatModuleInterface
        let viewController = chooseSeatModule.createModule()
        view?.pushViewControllerAble(
            viewController,
            animated: true)
    }
    
   
}
