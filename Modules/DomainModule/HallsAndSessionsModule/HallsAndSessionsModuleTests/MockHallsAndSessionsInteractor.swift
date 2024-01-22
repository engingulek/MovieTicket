import Foundation
import ModelKit
@testable import HallsAndSessionsModule

enum MockError: Error {
    case mockError
}

class MockHallsAndSessionsInteractor : HallsAndSessionsInteractorProtocol {
    var mocResultData : [HallAndSession] = []
    
    var filterHallsAndSessionsShouldReturnError : Bool = false
    func filterHallsAndSessionsFilterDate(movieId: Int, date: String) async throws -> [HallAndSession] {
        if filterHallsAndSessionsShouldReturnError {
            throw MockError.mockError
        }else{
            return mocResultData
        }
    }

}
