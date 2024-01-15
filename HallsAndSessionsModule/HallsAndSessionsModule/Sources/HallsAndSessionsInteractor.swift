
import Foundation
import NetworkKit
protocol HallsAndSessionsInteractorProtocol {
    func fetchHallsAndSessions(movieId:Int) async throws -> [HallAndSession]
    func filterHallsAndSessionsFilterDate(movieId:Int,date:String) async throws -> [HallAndSession]
}


class HallsAndSessionsInteractor : HallsAndSessionsInteractorProtocol {
    
    static let shared = HallsAndSessionsInteractor()
    
    // MARH: fetch HallsAndSessions For selected movie
    func fetchHallsAndSessions(movieId: Int) async throws -> [HallAndSession] {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .hallsAndSessions(movieId),
                responseClass: DictinoryResult<HallAndSession>.self)
            //Convert from Dictionart's Values to Array
            return Array(response.values)
        }catch{
            throw error
        }
    }
    
    func filterHallsAndSessionsFilterDate(movieId: Int, date: String) async throws -> [HallAndSession] {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .hallsAndSessions(movieId),
                responseClass: DictinoryResult<HallAndSession>.self)
            //Convert from Dictionart's Values to Array
            let list = Array(response.values).filter {  $0.date == date}
            return list
        }catch{
            throw error
        }
    }
    
    
}
