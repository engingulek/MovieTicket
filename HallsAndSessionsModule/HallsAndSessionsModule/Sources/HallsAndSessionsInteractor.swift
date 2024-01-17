import Foundation
import NetworkKit

protocol HallsAndSessionsInteractorProtocol {
    func filterHallsAndSessionsFilterDate(movieId:Int,date:String) async throws -> [HallAndSession]
}

class HallsAndSessionsInteractor : HallsAndSessionsInteractorProtocol {

    static let shared = HallsAndSessionsInteractor()
    
    /// fetch HallsAndSessions For selected movie
    ///  - Parameter movieId: Movie Id
    ///  - Parameter date: Session date of movie
    ///  - Returns: [HallAndSession]
    func filterHallsAndSessionsFilterDate(movieId: Int, 
                               date: String) async throws -> [HallAndSession] {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .hallsAndSessions(movieId),
                responseClass: DictinoryResult<HallAndSession>.self)
            //Convert from Dictionart's Values to Array
            let list = Array(response.values).filter { $0.date == date}
            return list
        }catch{
            throw error
        }
    }
}
