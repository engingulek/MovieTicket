import Foundation
// MARK: - HallAndSessionValue
struct HallAndSession: Codable {
    let cinameName, date: String
    let hallNumber, id: Int
    let language: [Language]
    let movieID: Int

    enum CodingKeys: String, CodingKey {
        case cinameName, date, hallNumber, id, language
        case movieID = "movieId"
    }
}

// MARK: - Language
struct Language: Codable {
    let id: Int
    let type: String
}
