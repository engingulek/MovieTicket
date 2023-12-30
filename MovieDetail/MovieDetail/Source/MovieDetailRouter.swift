import UIKit
import DependenyKit
import HallsAndSessionsModule
protocol MovieDetailRouterInterface {
    func toHallsAndSessions(view:MovieDetailViewControllerInterface?)
}

public final class MovieDetailRouter : MovieDetailModuleInterface {
    public init(){}
    public func createMovieDetailModule() -> UIViewController {
        let view = MovieDetailViewController()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(view: view,router: router)
        view.presenter = presenter
        return view
    }
}


extension MovieDetailRouter : MovieDetailRouterInterface {
    func toHallsAndSessions(view:MovieDetailViewControllerInterface?) {
        @Dependency var hallsAndSessionsInterface : HallsAndSessionsModuleInterface
        let viewController = hallsAndSessionsInterface.createModule()
        view?.pushViewControllerAble(
            viewController, 
            animated: true)
        
    }

}
