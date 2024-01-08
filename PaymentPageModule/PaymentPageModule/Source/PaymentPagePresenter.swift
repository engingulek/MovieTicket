
import Foundation
import ThemeKit
protocol PaymentPagePresenterInterface {
    var view : PaymentPageViewControllerInterface? {get}
    func viewDidLoad()
    func buyTicketButtonTapped()
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
    
    func buyTicketButtonTapped() {
        router?.toTicket(view: view)
    }
    
    
}
