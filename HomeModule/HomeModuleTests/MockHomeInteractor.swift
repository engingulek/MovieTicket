import Foundation
import ModelKit
@testable import HomeModule
enum MockError: Error {
    case mockError
}

class MockHomeInteractor : HomeInteractorProtocol {
    var mockMovieResultData : [MovieResult] = []
    
    var movieInCinemaShouldReturnError : Bool = false
    func fetchMovieInCinema() async throws -> [MovieResult] {
        if movieInCinemaShouldReturnError {
            print("Deneme")
            throw MockError.mockError
        }else{
            return mockMovieResultData
        }
    }
    
    
    var futureMovieShouldReturnError : Bool = false
    func fetchFutureMovie() async throws -> [MovieResult] {
        if futureMovieShouldReturnError {
            throw MockError.mockError
        }else{
            return mockMovieResultData
        }
    }
}
