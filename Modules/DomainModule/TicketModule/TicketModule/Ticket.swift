import Foundation

// MARK: - Ticket
struct Ticket: Codable {
    let barcode: Int
    let date: String
    let hall: Int
    let hour, movieName: String
    let movieURL: String
    let phoneNumber: String
    let seats: [Seat]

    enum CodingKeys: String, CodingKey {
        case barcode, date, hall, hour, movieName
        case movieURL = "movieUrl"
        case phoneNumber, seats
    }
    
    public static let defaultData = Ticket(
        barcode: 100000000,
        date: "01/18/2024",
        hall: 3,
        hour: "12:40",
        movieName: "Movie Name",
        movieURL: "",
        phoneNumber: "111111111",
        seats: [.init(col: 1, row: 2),.init(col: 1, row: 3)])
}

// MARK: - Seat
struct Seat: Codable {
    let col, row: Int
}

