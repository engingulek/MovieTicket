import Foundation
import ThemeKit
protocol TicketListPresenterInterface {
    var view : TicketListViewControllerInterface? {get}
    var router : TicketListRouterInterface? {get}
    func viewDidLoad()
    func viewWillAppear()
    func didSelectRow(at indexPath:IndexPath)
}

final class TicketListPresenter : TicketListPresenterInterface {
   
    var view: TicketListViewControllerInterface?
    var router: TicketListRouterInterface?
    
    init(view: TicketListViewControllerInterface?,
         router : TicketListRouterInterface? = nil) {
        self.view = view
        self.router = router
    }
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
       
        
    }
    
    func viewWillAppear(){
        view?.tabbarisHidden(isHidden: false)
        view?.navigationBarHidden(isHidden: true)
    }
    
    
    func didSelectRow(at indexPath: IndexPath) {
        router?.toTicketView(view:view)
    }
    
    
}
