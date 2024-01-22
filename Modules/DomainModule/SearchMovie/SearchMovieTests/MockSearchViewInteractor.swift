import Foundation
import ModelKit
@testable import SearchMovie
enum MockError: Error {
    case mockError
}

class MockSearchViewInteractor : SearchViewInteractorProtocol {
    var mockMovieResultData : [MovieResult] = []
    
    var searchMovieInCinemaShouldReturnError : Bool = false
    func searchMovieInCinema() async throws -> [MovieResult] {
        if searchMovieInCinemaShouldReturnError {
            throw MockError.mockError
        }else{
            return mockMovieResultData
        }
    }
    var searchFutureMovieShouldReturnError : Bool = false
    func searchFutureMovie() async throws -> [MovieResult] {
        if searchFutureMovieShouldReturnError {
            throw MockError.mockError
        }else{
            return mockMovieResultData
        }
    }
    
    
}
