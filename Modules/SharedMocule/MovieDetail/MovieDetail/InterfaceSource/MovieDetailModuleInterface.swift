
import Foundation
import UIKit
import ModelKit
public protocol MovieDetailModuleInterface {
    func createMovieDetailModule(movie : MovieResult,buttonHidden:Bool) -> UIViewController
}
