import UIKit

protocol MovieDetailRouterInterface {
    
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
    
}
