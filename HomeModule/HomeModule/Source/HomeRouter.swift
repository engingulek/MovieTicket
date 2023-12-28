import Foundation
import MovieDetail
import UIKit
import DependenyKit
protocol HomeRouterInterface {
    func toMovieDetail(view:HomeViewControllerInterface?)
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
        print("allll")
        @Dependency var movieDetailModuleInterface : MovieDetailModuleInterface
        let viewController = movieDetailModuleInterface.createMovieDetailModule()
        view?.pushViewControllerAble(viewController, animated: true)
    }
}
