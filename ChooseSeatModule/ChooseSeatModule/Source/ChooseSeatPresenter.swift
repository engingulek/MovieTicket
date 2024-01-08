
import Foundation
import ThemeKit


protocol ChooseSeatPresenterInterface {
    var view : ChooseSeatViewControllerInterface? {get}
    var router : ChooseSeatRouterInterface? {get}
    func viewDidLoad()
    func toPaymentPage()
}


final class ChooseSeatPresenter : ChooseSeatPresenterInterface {
    var view: ChooseSeatViewControllerInterface?
    var router: ChooseSeatRouterInterface?
    
    
    init(view: ChooseSeatViewControllerInterface?,
        router: ChooseSeatRouterInterface? = nil) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.prepareCollectionView()
        view?.reloadCollecionView()
        view?.changeTitle(title: "Choose Seat")
    }
    
    
    func toPaymentPage() {
        router?.toPaymentPage(view: view)
    }
    

    
}
