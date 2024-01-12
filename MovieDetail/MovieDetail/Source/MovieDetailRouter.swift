import UIKit
import DependenyKit
import HallsAndSessionsModule
import ModelKit
protocol MovieDetailRouterInterface {
    func toHallsAndSessions(view:MovieDetailViewControllerInterface?)
    
}

public final class MovieDetailRouter : MovieDetailModuleInterface {
    public init(){}
   
    public func createMovieDetailModule(movie : MovieResult) -> UIViewController {
        let view = MovieDetailViewController()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(view: view,router: router)
        presenter.movieInfo = movie
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
