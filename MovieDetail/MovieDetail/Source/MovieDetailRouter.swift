import UIKit

public final class MovieDetailRouter : MovieDetailModuleInterface {
    public init(){}
    public func createMovieDetailModule() -> UIViewController {
        let view = MovieDetailViewController()
        return view
    }
    
    
}
