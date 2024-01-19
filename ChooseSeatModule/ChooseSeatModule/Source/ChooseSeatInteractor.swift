import Foundation
import NetworkKit

private enum ChooseSeatError : Error {
    case indexRange
}

protocol ChooseSeatInteractorProtocol {
    func chooseHallAndSessionInfo( _ hallSessioniD:Int,
                         _ languageId:Int)  async throws -> ChooseHallAndSessionInfo?
    func hoursAndSeats(chooseId:Int) async throws -> SeatAndHoursInfo
}

class ChooseSeatInteractor : ChooseSeatInteractorProtocol {
    static let shared = ChooseSeatInteractor()
    
    func chooseHallAndSessionInfo(_ hallSessioniD:Int, 
                        _ languageId:Int) async throws -> ChooseHallAndSessionInfo? {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .choosedHallAndSession,
                responseClass: DataResult<[ChooseHallAndSessionInfo]>.self)

            let info = response.list.filter {  $0.hallSessionID == hallSessioniD &&
                $0.language.id == languageId
            }
            return info.first
        }catch{
            throw error
        }
    }
    
    func hoursAndSeats(chooseId: Int) async throws -> SeatAndHoursInfo {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .hoursAndSeats,
                responseClass: DataResult<[SeatAndHoursInfo]>.self)
            let info = response.list.filter{$0.chooseID == chooseId }
            if info.isEmpty {
                throw ChooseSeatError.indexRange
            }else{
                return info[0]
            }
        }catch {
            throw error
        }
    }
}
