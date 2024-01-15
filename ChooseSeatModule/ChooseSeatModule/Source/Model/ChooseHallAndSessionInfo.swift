
// MARK: - ChooseHallAndSessionInfo
struct ChooseHallAndSessionInfo: Decodable {
    let cinemaName, date: String
    let hallNumber, hallSessionID, id: Int
    let language: Language
    let movieName: String
    let ticketAmount: Int

    enum CodingKeys: String, CodingKey {
        case cinemaName, date, hallNumber
        case hallSessionID = "hallSessionId"
        case id, language, movieName, ticketAmount
    }
}

// MARK: - Language
struct Language: Decodable {
    let id: Int
    let type: String
}

