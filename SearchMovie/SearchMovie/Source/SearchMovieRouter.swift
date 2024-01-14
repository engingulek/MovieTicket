
import Foundation
import UIKit
import DependenyKit
import ModelKit
import MovieDetail
protocol SearchMovieRouterInterface {
   func  toMovieDetail(movie:MovieResult,view:SearchMovieViewControllerInterface?,buttonHidden:Bool)
}


public class SearchMovieRouter : SearcMovieModuleInterface {
    public init() {}
    public func createModule(searchText:String) -> UIViewController {
        let view = SearchMovieViewController()
        let router = SearchMovieRouter()
        let presenter = SearchMoviePresenter(view: view,router:router)
        presenter.searchText = searchText 
        view.presenter =  presenter
        return view
    }
}

extension SearchMovieRouter : SearchMovieRouterInterface {
    func toMovieDetail(
        movie: ModelKit.MovieResult,
        view: SearchMovieViewControllerInterface?,
        buttonHidden: Bool) {
            @Dependency var movieDetailModuleInterface : MovieDetailModuleInterface
            let viewController = movieDetailModuleInterface.createMovieDetailModule(
                movie: movie,
                buttonHidden: buttonHidden)
            view?.pushViewControllerAble(viewController, animated: true)
    }
}
