import Foundation
import UIKit

public protocol ChooseSeatModuleInterface {
    func createModule(hallAndSessionId:Int,languageId:Int) -> UIViewController
}
