import Foundation
import NetworkKit
import ModelKit
protocol HomeInteractorProtocol {
    func fetchGenres() async throws -> [Genres]
    func fetchMovieInCinema() async throws -> [MovieResult]
    func fetchFutureMovie() async throws -> [MovieResult]
}

final class HomeInteractor : HomeInteractorProtocol {

    static let shared = HomeInteractor()
    
    // MARK: - Fetch Genres
    func fetchGenres() async throws -> [Genres] {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .genres,
                responseClass: DataResult<[Genres]>.self)
            return response.list
        }catch{
            throw error
        }
    }
    
    // MARK: - Fetch MovieInCinema
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
