import Foundation

// MARK: - SeatAndHoursInfo
struct SeatAndHoursInfo : Decodable {
    let id: Int
    let chooseID: Int
    let hours: [Hour]
    
    enum CodingKeys: String, CodingKey {
            case chooseID = "chooseId"
            case hours, id
        }
}

// MARK: - Hour
struct Hour: Decodable {
    let hour: String
    let id: Int
    let seatsInfo: [SeatsInfo]
}


// MARK: - SeatsInfo
struct SeatsInfo: Codable,Equatable {
   
    let col, row: Int
    let status: String
}
