
import Foundation
import UIKit

protocol SearchMovieRouterInterface {
    
}


public class SearchMovieRouter : SearcMovieModuleInterface {
    public init() {}
    public func createModule() -> UIViewController {
        let view = SearchMovieViewController()
        return view
    }

}
