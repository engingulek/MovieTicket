
import Foundation
import UIKit
import DependenyKit
import ChooseSeatModule
protocol HallsAndSessionsRouterInterface {
    func toChooseSeat(view:HallsAndSessionsViewControllerInterface?,
                 hallAndSessionId:Int,
                 languageId:Int)
}

public final class HallsAndSessionsRouter : HallsAndSessionsModuleInterface {
    
    public init(){}
    
    public func createModule(movieId:Int) -> UIViewController {
        let view = HallsAndSessionsViewController()
       let router = HallsAndSessionsRouter()
       let presenter = HallsAndSessionsPresenter(view: view, router: router)
        presenter.movieId = movieId
       view.presenter = presenter
       return view
    }
}


extension HallsAndSessionsRouter : HallsAndSessionsRouterInterface {
    func toChooseSeat(view: HallsAndSessionsViewControllerInterface?,
                 hallAndSessionId:Int,
                 languageId:Int) {
        @Dependency var chooseSeatModule : ChooseSeatModuleInterface
        let viewController = chooseSeatModule.createModule(
            hallAndSessionId: hallAndSessionId,
            languageId: languageId)
        view?.pushViewControllerAble(
            viewController,
            animated: true)
    }
    
   
}
