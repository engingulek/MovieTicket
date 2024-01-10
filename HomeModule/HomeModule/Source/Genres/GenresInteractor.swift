import Foundation
import NetworkKit

protocol GenresInteractorProtocol {
    func fetchGenres() async throws -> [Genres]
}

final class GenresInteractor : GenresInteractorProtocol {
    
    static let shared = GenresInteractor()
    
    // MARK: - Fetch Genres
    func fetchGenres() async throws -> [Genres] {
        do{
            let response = try await NetworkManager.shared.fetch(
                target: .genres,
                responseClass: DataResult<[Genres]>.self)
            return response.data
        }catch{
            throw error
        }
    }
}
