import Foundation
import ThemeKit

protocol TicketPresenterInterface{
    var view: TicketViewControllerInterface?{get}
    func viewDidLoad()
}

final class TicketPresenter : TicketPresenterInterface {
    weak var view: TicketViewControllerInterface?
    init(view: TicketViewControllerInterface?) {
        self.view = view
    }
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.navigationBarHidden(isHidden: false)
        view?.changeNavBarColor(color: Theme.theme.themeColor.primaryBackground)
        view?.changeTintColor(color: Theme.theme.themeColor.primaryLabel)
        view?.changeTitle(title: "Ticket")
        view?.tabbarisHidden(isHidden: true)
    }
    
    
}

