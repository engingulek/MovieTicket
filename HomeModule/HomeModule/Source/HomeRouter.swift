import Foundation
import MovieDetail
import SearchMovie
import UIKit
import DependenyKit

protocol HomeRouterInterface {
    func toMovieDetail(view:HomeViewControllerInterface?)
    func toSearchMovie(view:HomeViewControllerInterface?)
}

public final class HomeRouter : HomeModuleInterface {
    public init(){}
    public func createHomeModule() -> UIViewController {
        let view = HomeViewController()
        let router = HomeRouter()
        let presenter = HomePresenter(
            view: view,
            router: router)
        view.presenter = presenter
        return view
    }
}

extension HomeRouter : HomeRouterInterface {
   
    func toMovieDetail(view:HomeViewControllerInterface?) {
        @Dependency var movieDetailModuleInterface : MovieDetailModuleInterface
        let viewController = movieDetailModuleInterface.createMovieDetailModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    func toSearchMovie(view: HomeViewControllerInterface?) {
        @Dependency var searchMovieModuleInterface : SearcMovieModuleInterface
        let viewController = searchMovieModuleInterface.createModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
}
