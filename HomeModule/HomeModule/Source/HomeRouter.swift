import Foundation
import UIKit

public final class HomeRouter : HomeModuleInterface {
    public init(){}
    public func createHomeModule() -> UIViewController {
        let view = HomeViewController()
        return view
    }
}
