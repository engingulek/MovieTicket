
import Foundation


public struct CreatedTicketInfo {
    public let moveiImageUrl:String
    public let movieName:String
    public let selectedSeat:[SelectedSeat]
    public let selectedHour:String
    public let selectedDate:String
    public let cinemaName:String
    public let hallNumber:Int
    public let languageType:String
    public let ticketAmount:Int
    
    
   public init(moveiImageUrl: String, movieName: String, 
        selectedSeat: [SelectedSeat], selectedHour: String,
        selectedDate: String, cinemaName: String,
        hallNumber: Int, languageType: String, ticketAmount: Int) {
        self.moveiImageUrl = moveiImageUrl
        self.movieName = movieName
        self.selectedSeat = selectedSeat
        self.selectedHour = selectedHour
        self.selectedDate = selectedDate
        self.cinemaName = cinemaName
        self.hallNumber = hallNumber
        self.languageType = languageType
        self.ticketAmount = ticketAmount
    }
    
    public static let defaultData = CreatedTicketInfo(
        moveiImageUrl: "",
        movieName: "Movie Name",
        selectedSeat: [.init(row: 1, col: 1),.init(row: 2, col: 1),.init(row: 4, col: 1)],
        selectedHour: "12:40",
        selectedDate: "01/17/2024",
        cinemaName: "Ciname Name",
        hallNumber: 3,
        languageType: "English",
        ticketAmount: 30)
    
    public func seatsInfo() -> String {
        var seatsInfo = "Seat(s) : "
        for seat in selectedSeat {
            seatsInfo += "-(R:\(seat.row) C:\(seat.col)) - "
        }
        return seatsInfo
    }
}


public struct SelectedSeat : Equatable {
    public let row:Int
    public let col:Int
    
    public init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
}
