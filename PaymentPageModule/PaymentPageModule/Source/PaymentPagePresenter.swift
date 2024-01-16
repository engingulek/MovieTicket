
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
       // router?.toTicket(view: view)
    }
    
    private func controlForContanctInfo(contanctInfo:ContanctInfo){
        if contanctInfo.name.count <= 3 {
            view?.congigureUIForContanctInfo(color: "#FF0000", tag: 0)
        }else{
            view?.congigureUIForContanctInfo(color: Theme.theme.themeColor.primaryLabel, tag: 0)
        }
        if contanctInfo.surname.count <= 2{
            view?.congigureUIForContanctInfo(color: "#FF0000", tag: 1)
        }else{
            view?.congigureUIForContanctInfo(color: Theme.theme.themeColor.primaryLabel, tag: 1)
        }
        if !contanctInfo.email.isValidEmail() {
            view?.congigureUIForContanctInfo(color: "#FF0000", tag: 2)
        }else{
            view?.congigureUIForContanctInfo(color: Theme.theme.themeColor.primaryLabel, tag: 2)
        }
        if contanctInfo.phoneNumber.isEmpty {
            view?.congigureUIForContanctInfo(color: "#FF0000", tag: 3)
        }else{
            view?.congigureUIForContanctInfo(color: Theme.theme.themeColor.primaryLabel, tag: 3)
        }
        
    }
    
    
}
