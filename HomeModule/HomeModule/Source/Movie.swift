
import Foundation

// MARK: - List
struct Movie: Decodable {
    let cast: [Cast]
    let detailImageURL: String
    let director: String
    let genres: [String]
    let id: Int
    let imageURL: String
    let movieInfo, name: String
    let runtime: Int
    let year: String

    enum CodingKeys: String, CodingKey {
        case cast
        case detailImageURL = "detailImageUrl"
        case director, genres, id
        case imageURL = "imageUrl"
        case movieInfo, name, runtime, year
    }
}

// MARK: - Cast
struct Cast: Decodable {
    let id: Int
    let imageURL: String
    let name, role: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case name, role
    }
}

