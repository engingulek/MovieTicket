import Foundation
import NetworkKit
import ModelKit

protocol HomeInteractorProtocol {
    func fetchMovieInCinema() async throws -> [MovieResult]
    func fetchFutureMovie() async throws -> [MovieResult]
}

final class HomeInteractor : HomeInteractorProtocol {

    static let shared = HomeInteractor()
    
    // MARK: - Fetch MovieInCinema
    /// Description : Movie in the cinema are brought here
    /// - Returns: [MovieResult]
    func fetchMovieInCinema() async throws -> [MovieResult] {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .movieInCinema,
                responseClass: DataResult<[MovieResult]>.self)
            return response.list
        }catch{
            throw error
        }
    }
    
    // MARK: - Fetch FutureMovie
    /// Description:  Movie in the future are brought here
    /// - Returns: [MovieResult]
    func fetchFutureMovie() async throws -> [MovieResult] {
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
