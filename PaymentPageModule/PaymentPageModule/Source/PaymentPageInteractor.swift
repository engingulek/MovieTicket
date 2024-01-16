import Foundation
import NetworkKit

protocol PaymentPageInteractorProtocol {
    func createTicket(parametets:[String:Any]) async throws
}


class PaymentPageInteractor : PaymentPageInteractorProtocol {
    static let shared = PaymentPageInteractor()
    func createTicket(parametets:[String:Any]) async throws {
        do {
          _ =  try await NetworkManager.shared.fetch(
                target: .createTicket(parametets),
                responseClass: AddDataResult.self)
        }catch{
            throw error
        }
    }
    
    
}
