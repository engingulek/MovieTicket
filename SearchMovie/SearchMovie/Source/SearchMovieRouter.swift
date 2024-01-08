
import Foundation
import UIKit

protocol SearchMovieRouterInterface {
    
}


public class SearchMovieRouter : SearcMovieModuleInterface {
    public init() {}
    public func createModule() -> UIViewController {
        let view = SearchMovieViewController()
        let router = SearchMovieRouter()
        let presenter = SearchMoviePresenter(view: view,router:router)
        view.presenter =  presenter
        return view
    }
}

extension SearchMovieRouter : SearchMovieRouterInterface {
    
}
