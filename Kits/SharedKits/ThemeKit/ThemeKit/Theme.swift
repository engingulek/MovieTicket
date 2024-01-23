

import Foundation
import UIKit

public struct Theme {
    public let themeColor : ThemeColor
    public let themeFont : ThemeFont
    public let themeText: ThemeText
    public let themeSystemImageName:ThemeSystemNameImage
}

//MARK: ThemeColor
public struct ThemeColor {
    public  let primaryBackground: String
    public  let secondaryBack : String
    public  let thirdBack : String
    public  let primaryLabel:String
    public  let secondaryLabel:String
    public let thirdLabel :String
    public let textFieldBackColor : String
    public let alertTextFieldBorderColor:String
    public let activityIndicatorColor:String
    public let fullSeat:String
    public let choosenSeat:String
    public let emptySeat:String
}

//MARK: ThemeFont
public struct ThemeFont {
    public let primaryFont: UIFont
    public let secondaryFont: UIFont
    public let thirdFont : UIFont
    public let cellLabelFont: UIFont
    public let cellSubLabelFont: UIFont
}

//MARK: ThemeText
public struct ThemeText {
    public let movieInCinema : String
    public let future : String
    public let defaultText : String
    public let searchTextFieldPlaceholder:String
    public let movieInfo:String
    public let casts: String
    public let hall:String
    public let chooseCinemaButtonTitle : String
    public let defaultSearchText:String
    public let navTitleSearchMovie:String
    public let navTitleChooseCinema:String
    public let navTitleChooseSeat:String
    public let navTiletPayment:String
    public let navTitleTicket:String
    public let scene : String
    public let full : String
    public let chosen:String
    public let empty:String
    public let payNowButton:String
    public let chosenSeat:String
    public let contanctInfo:String
    public let contanctDescription:String
    public let namePlaceholder:String
    public let surnamePlaceholder:String
    public let emailPlaceholder:String
    public let nameOnTheCard:String
    public let cardNumber:String
    public let expirationDate:String
    public let expirationDatePlace:String
    public let securityCode:String
    public let buyTicket:String
    public let seats:String
    
}

public struct ThemeSystemNameImage {
    public let searchIcon : String
    public let mapIn:String
}

extension Theme {
    public static var theme : Theme{
        Theme(
            themeColor:ThemeColor(
            primaryBackground: "#211921",
            secondaryBack: "#382C3E",
            thirdBack: "#7C44C2",
            primaryLabel: "#FEFFFF",
            secondaryLabel: "#998396",
            thirdLabel: "#000000",
            textFieldBackColor: "#808080",
            alertTextFieldBorderColor: "#FF0000", 
            activityIndicatorColor: "#FEFFFF",
            fullSeat: "#FF0000",
            choosenSeat: "#7C44C2",
            emptySeat: "#FEFFFF"
            
            ),
            
            themeFont: ThemeFont(
            primaryFont: .systemFont(ofSize: FontSize.primarySize),
            secondaryFont: .systemFont(ofSize: FontSize.secondarySizie),
            thirdFont: .systemFont(ofSize: FontSize.thirdLabel),
            cellLabelFont: .systemFont(ofSize: FontSize.cellLabel),
            cellSubLabelFont: .systemFont(ofSize: FontSize.cellSubLabel)),
            
            themeText: ThemeText(
            movieInCinema: "Movie In Cinema",
            future: "Upcoming Movie",
            defaultText: "", 
            searchTextFieldPlaceholder: "Search Movie",
            movieInfo: "Movie Info", 
            casts: "Casts", 
            hall: "Hall", 
            chooseCinemaButtonTitle: "Choose Cinema",
            defaultSearchText: "Default Search Text", 
            navTitleSearchMovie: "Search Movie", 
            navTitleChooseCinema: "Choose Cinema", 
            navTitleChooseSeat: "Choose Seat", 
            navTiletPayment: "Payment", 
            navTitleTicket: "Ticket", 
            scene: "Scene",
            full: "Full",
            chosen: "Chosen",
            empty: "Empty", 
            payNowButton: "Pay Now", 
            chosenSeat: "Chosen Seat", 
            contanctInfo: "Contanct Info", 
            contanctDescription:  "Your ticket will be prepare according to the following information", 
            namePlaceholder: "Name",
            surnamePlaceholder: "Surname", 
            emailPlaceholder: "Email", 
            nameOnTheCard: "Name On The Card", 
            cardNumber: "Card Number", 
            expirationDate: "Expiration Date", 
            expirationDatePlace: "MM/YY", 
            securityCode: "Security Code", 
            buyTicket: "Buy Ticket", 
            seats: "Seats"
            ),
            
            themeSystemImageName: ThemeSystemNameImage(
                searchIcon: "magnifyingglass", 
                mapIn: "mappin.and.ellipse")
        )
    }
}
