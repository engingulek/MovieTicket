import Foundation

import NetworkKit
import ModelKit

protocol SearchViewInteractorProtocol {
    func searchMovieInCinema() async throws -> [MovieResult]
    func searchFutureMovie() async throws  -> [MovieResult]
}

final class SearchViewInteractor : SearchViewInteractorProtocol {
    
    static let shared = SearchViewInteractor()

    func searchMovieInCinema() async throws -> [MovieResult]  {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .movieInCinema,
                responseClass: DataResult<[MovieResult]>.self)
            return response.list
           
        }catch{
            throw error
        }

    }
    
    func searchFutureMovie() async throws -> [MovieResult]  {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .futureMovie,
                responseClass: DataResult<[MovieResult]>.self)
            
            return response.list
        }catch{
            throw error
        }

    }
    
  
  
    
    
}


