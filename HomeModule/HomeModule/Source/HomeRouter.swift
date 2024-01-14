import Foundation
import MovieDetail
import SearchMovie
import UIKit
import DependenyKit
import ModelKit

protocol HomeRouterInterface {
    func toMovieDetail(movie:MovieResult,view:HomeViewControllerInterface?,buttonHidden:Bool)
    func toSearchMovie(searchText:String,view: HomeViewControllerInterface?)
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
   
    func toMovieDetail(movie:MovieResult,view:HomeViewControllerInterface?,buttonHidden:Bool) {
        @Dependency var movieDetailModuleInterface : MovieDetailModuleInterface
        let viewController = movieDetailModuleInterface.createMovieDetailModule(
            movie: movie,
            buttonHidden: buttonHidden)
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    func toSearchMovie(searchText:String,view: HomeViewControllerInterface?) {
        @Dependency var searchMovieModuleInterface : SearcMovieModuleInterface
        let viewController = searchMovieModuleInterface.createModule(searchText: searchText)
        view?.pushViewControllerAble(viewController, animated: true)
    }
}
