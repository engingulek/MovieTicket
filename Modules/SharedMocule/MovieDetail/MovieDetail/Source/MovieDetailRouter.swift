import UIKit
import DependenyKit
import HallsAndSessionsModule
import ModelKit
protocol MovieDetailRouterInterface {
    func toHallsAndSessions(view:MovieDetailViewControllerInterface?,movieId:Int)
}

public final class MovieDetailRouter : MovieDetailModuleInterface {
    public init(){}
   
    public func createMovieDetailModule(movie : MovieResult,buttonHidden:Bool = false) -> UIViewController {
        let view = MovieDetailViewController()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(view: view,router: router)
        presenter.movieInfo = movie
        presenter.buttonHidde = buttonHidden
        view.presenter = presenter
        return view
    }
}


extension MovieDetailRouter : MovieDetailRouterInterface {
    func toHallsAndSessions(view:MovieDetailViewControllerInterface?,movieId:Int) {
        @Dependency var hallsAndSessionsInterface : HallsAndSessionsModuleInterface
        let viewController = hallsAndSessionsInterface.createModule(movieId: movieId)
        view?.pushViewControllerAble(
            viewController, 
            animated: true)
    }

}
