import Foundation
import UIKit


public protocol PaymentPageModuleInterface {
    func createModule(ticketInfo:[String:Any]) -> UIViewController
}
