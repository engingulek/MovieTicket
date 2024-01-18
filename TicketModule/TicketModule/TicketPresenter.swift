import Foundation
import ThemeKit
import CommenUIKit
protocol TicketPresenterInterface{
    var view: TicketViewControllerInterface?{get}
    func viewDidLoad()
}

final class TicketPresenter : TicketPresenterInterface {
    weak var view: TicketViewControllerInterface?
    private var interactor : TicketInteractorProtocol
    var id : String?
    var ticket : Ticket?
    init(view: TicketViewControllerInterface?,
         interactor : TicketInteractorProtocol = TicketInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchTicket() async {
        do{
            guard let id = id else {return}
            let result = try await interactor.fetchTicket(ticketId: id)
            ticket = result
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.navigationBarHidden(isHidden: false)
        view?.changeNavBarColor(color: Theme.theme.themeColor.primaryBackground)
        view?.changeTintColor(color: Theme.theme.themeColor.primaryLabel)
        view?.changeTitle(title: "Ticket")
        Task {
            @MainActor in
            await fetchTicket()
            guard let ticket = ticket else {return}
            view?.ticketInfoView(ticket: ticket)
        }
    }
}

