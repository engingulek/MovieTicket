
import Foundation
import ThemeKit
protocol PaymentPagePresenterInterface {
    var view : PaymentPageViewControllerInterface? {get}
    func viewDidLoad()
    func buyTicketButtonTapped(contanctInfo:ContanctInfo,cardInfo:CardInfo)
}


class PaymentPagePresenter : PaymentPagePresenterInterface {
    
    weak var view: PaymentPageViewControllerInterface?
    var router: PaymenPageRouterInterface?
    private var controlInfo : Bool = false
    
    init(view: PaymentPageViewControllerInterface?,
         router: PaymenPageRouterInterface? = nil) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground )
        view?.changeTitle(title: "Payment")
    }
    
    func buyTicketButtonTapped(contanctInfo:ContanctInfo,cardInfo:CardInfo) {
        controlForContanctInfo(contanctInfo: contanctInfo)
        controlForCardInfo(cardInfo: cardInfo)
        if controlInfo {
            router?.toTicket(view: view)
        }else{
            view?.createAlertMesssage(
                title: "Alert",
                message: "Please check the red areas",
                actionTitle: "Okey")
        }
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
        
        
        if cardInfo.cardNumber.count != 16 {
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
