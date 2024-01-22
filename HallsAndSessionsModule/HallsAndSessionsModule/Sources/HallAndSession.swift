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
    
    static let defaultData : HallAndSession =
        .init(cinameName: "Test",
              date: "Test",
              hallNumber: 0,
              id: 0,
              language: [.init(id: 0, type: "Test")],
              movieID: 0)
    
    
}

// MARK: - Language
struct Language: Codable {
    let id: Int
    let type: String
}
