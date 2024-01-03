import Foundation
import UIKit

public final class TabbarRouter : TabbarModuleInterface {
    public init() {}
    public func createHomeModule() -> UIViewController {
        let view = TabbarController()
        return view
    }
}
