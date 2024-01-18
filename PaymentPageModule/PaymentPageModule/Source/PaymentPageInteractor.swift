import Foundation
import NetworkKit

protocol PaymentPageInteractorProtocol {
    func createTicket(parametets:[String:Any]) async throws -> String
}


class PaymentPageInteractor : PaymentPageInteractorProtocol {
    static let shared = PaymentPageInteractor()
    func createTicket(parametets:[String:Any]) async throws -> String {
        do {
          let result =  try await NetworkManager.shared.fetch(
                target: .createTicket(parametets),
                responseClass: AddDataResult.self)
            return result.name
        }catch{
            throw error
        }
    }
}
