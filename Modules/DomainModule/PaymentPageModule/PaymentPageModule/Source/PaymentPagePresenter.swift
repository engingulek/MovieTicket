
import Foundation
import ThemeKit
import ModelKit


protocol PaymentPagePresenterInterface {
    var view : PaymentPageViewControllerInterface? {get}
    func viewDidLoad()
    func buyTicketButtonTapped(contanctInfo:ContanctInfo,cardInfo:CardInfo)
}


class PaymentPagePresenter : PaymentPagePresenterInterface {
    
    weak var view: PaymentPageViewControllerInterface?
    var router: PaymenPageRouterInterface?
    var createdTicket:CreatedTicketInfo = CreatedTicketInfo.defaultData
    private var interactor : PaymentPageInteractorProtocol
    private var controlInfo : Bool = false
    private var barcodeCode :Int = 0
    private var ticketId :String = ""
    
    
    init(view: PaymentPageViewControllerInterface?,
         router: PaymenPageRouterInterface? = nil,
         interactor:PaymentPageInteractorProtocol = PaymentPageInteractor.shared) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    private func createTicket(parameters:[String:Any]) async {
        do {
            let result =  try await interactor.createTicket(parametets: parameters)
            ticketId = result
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                view?.createAlertMesssage(
                    title: "Error",
                    message: "Something went wrong",
                    actionTitle: "Ok")
            }
        }
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground )
        view?.changeTitle(title: Theme.theme.themeText.navTiletPayment)
        view?.configureUIForMovieAndTicketInfo(createdTicket: createdTicket)
    }
    
    func buyTicketButtonTapped(contanctInfo:ContanctInfo,cardInfo:CardInfo) {
        controlForContanctInfo(contanctInfo: contanctInfo)
        controlForCardInfo(cardInfo: cardInfo)
        
        if controlInfo {
            barcodeCode = generateRandom9DigitNumber()
            let phoneNumber = contanctInfo.phoneNumber
            var seats : [[String:Any]] = []
            
            for selectedSeat in createdTicket.selectedSeat {
                let seat = ["row" : selectedSeat.row ,"col":selectedSeat.col]
                seats.append(seat)
            }
            
            let parameters:[String:Any] = [
                "movieUrl" : createdTicket.moveiImageUrl,
                "movieName" : createdTicket.movieName,
                "date" : createdTicket.selectedDate,
                "hour" : createdTicket.selectedHour,
                "hall": createdTicket.hallNumber,
                "seats": seats,
                "barcode" : barcodeCode,
                "phoneNumber": phoneNumber
            ]
            Task {
                @MainActor in
                await createTicket(parameters:parameters)
                router?.toTicket(view: view,ticketId:ticketId)
            }
            
        }else{
            view?.createAlertMesssage(
                title: "Alert",
                message: "Please check the red areas",
                actionTitle: "Okey")
        }
    }
    
    func generateRandom9DigitNumber() -> Int {
        let lowerBound = 100_000_000
        let upperBound = 999_999_999
        
        let randomNumber = Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1))) + lowerBound
        
        return randomNumber
    }
    
    private func controlForCardInfo(cardInfo:CardInfo){
        
        if cardInfo.nameOfTheCard.count <= 3 {
            view?.congigureUIForCardInfo(
                color: Theme.theme.themeColor.alertTextFieldBorderColor,
                tag: 0)
            controlInfo = false
        }else{
            view?.congigureUIForCardInfo(
                color: Theme.theme.themeColor.primaryLabel,
                tag: 0)
            controlInfo = true
        }
        
        
        if cardInfo.cardNumber.count != 19{
            view?.congigureUIForCardInfo(
                color: Theme.theme.themeColor.alertTextFieldBorderColor,
                tag: 1)
            controlInfo = false
        }else{
            view?.congigureUIForCardInfo(
                color: Theme.theme.themeColor.primaryLabel,
                tag: 1)
            controlInfo = true
        }
        
        if cardInfo.exparationDate.isEmpty ||
            cardInfo.exparationDate.convertStringToDate()! < Date.now.convertDateToString().convertStringToDate()! {
            view?.congigureUIForCardInfo(
                color: Theme.theme.themeColor.alertTextFieldBorderColor,
                tag: 2)
            controlInfo = false
        }else{
            view?.congigureUIForCardInfo(
                color: Theme.theme.themeColor.primaryLabel,
                tag: 2)
            controlInfo = true
        }
        
        if cardInfo.securarityCode.count < 3 {
            view?.congigureUIForCardInfo(
                color: Theme.theme.themeColor.alertTextFieldBorderColor,
                tag: 3)
            controlInfo = false
        }else{
            view?.congigureUIForCardInfo(
                color: Theme.theme.themeColor.primaryLabel,
                tag: 3)
            controlInfo = true
        }
    }
    
    private func controlForContanctInfo(contanctInfo:ContanctInfo) {
        if contanctInfo.name.count <= 3 {
            view?.congigureUIForContanctInfo(
                color: Theme.theme.themeColor.alertTextFieldBorderColor,
                tag: 0)
            controlInfo = false
        }else{
            view?.congigureUIForContanctInfo(
                color: Theme.theme.themeColor.primaryLabel,
                tag: 0)
            controlInfo = true
        }
        if contanctInfo.surname.count <= 2{
            view?.congigureUIForContanctInfo(
                color: Theme.theme.themeColor.alertTextFieldBorderColor,
                tag: 1)
            controlInfo = false
        }else{
            view?.congigureUIForContanctInfo(color: Theme.theme.themeColor.primaryLabel, tag: 1)
            controlInfo = true
        }
        if !contanctInfo.email.isValidEmail() {
            view?.congigureUIForContanctInfo(
                color: Theme.theme.themeColor.alertTextFieldBorderColor,
                tag: 2)
            controlInfo = false
        }else{
            view?.congigureUIForContanctInfo(color: Theme.theme.themeColor.primaryLabel, tag: 2)
            controlInfo = true
        }
        if contanctInfo.phoneNumber.isEmpty {
            view?.congigureUIForContanctInfo(
                color: Theme.theme.themeColor.alertTextFieldBorderColor,
                tag: 3)
            controlInfo = false
        }else{
            view?.congigureUIForContanctInfo(color: Theme.theme.themeColor.primaryLabel, tag: 3)
            controlInfo = true
        }
    }
}
