import Foundation
import UIKit
import ModelKit

public protocol PaymentPageModuleInterface {
    func createModule(createdTicket:CreatedTicketInfo) -> UIViewController
}
