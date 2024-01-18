
import Foundation
import NetworkKit
protocol TicketInteractorProtocol {
    func fetchTicket(ticketId:String) async throws -> Ticket
}

class TicketInteractor : TicketInteractorProtocol {
    static let shared = TicketInteractor()
    func fetchTicket(ticketId: String) async throws -> Ticket {
        do{
            print("Ticket Interactor \(ticketId)")
            let response = try await NetworkManager.shared.fetch(
                target: .ticketInfo(ticketId),
                responseClass: Ticket.self)
            return response
        }catch{
            print("Ticket Interactor Error \(error.localizedDescription)")
            throw error
        }
    }
}
