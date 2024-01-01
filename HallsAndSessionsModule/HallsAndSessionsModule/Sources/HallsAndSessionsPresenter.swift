
import Foundation
import ThemeKit

protocol HallsAndSessionsPresenterInterface {
    var view: HallsAndSessionsViewControllerInterface? {get}
    var router : HallsAndSessionsRouterInterface? {get}
    func viewDidLoad()
    func buyTicketButtonTapped()
    
}

final class HallsAndSessionsPresenter : HallsAndSessionsPresenterInterface {
   
    
    var view: HallsAndSessionsViewControllerInterface?
    var router : HallsAndSessionsRouterInterface?
    init(view: HallsAndSessionsViewControllerInterface?,
         router: HallsAndSessionsRouterInterface? = nil) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.prepareCollectionView()
        view?.reloadCollectionView()
        view?.prepareTableView()
        view?.reloadTableView()
    }
    
    
    func buyTicketButtonTapped() {
        print("ali")
        router?.toChooseSeat(view: view)
    }
    
    
    
}
