
import Foundation
import ThemeKit

protocol HallsAndSessionsPresenterInterface {
    var view: HallsAndSessionsViewControllerInterface? {get}
    var router : HallsAndSessionsRouterInterface? {get}
    func viewDidLoad()
    func buyTicketButtonTapped()
    func numberOfRowsInSection() -> Int
    func cellForRow(at indexPath : IndexPath) -> HallAndSession
}

final class HallsAndSessionsPresenter : HallsAndSessionsPresenterInterface {
   
    private var hallsAndSessions : [HallAndSession] = []
    var view: HallsAndSessionsViewControllerInterface?
    var router : HallsAndSessionsRouterInterface?
    private var interactor : HallsAndSessionsInteractorProtocol
    var movieId : Int = 0
    init(view: HallsAndSessionsViewControllerInterface?,
         router: HallsAndSessionsRouterInterface? = nil,
         interactor :HallsAndSessionsInteractorProtocol = HallsAndSessionsInteractor.shared ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    private func fetchHallsAndSessions() async {
       
        do {
            let result = try await interactor.fetchHallsAndSessions(movieId: movieId )
            print("Halll \(result.count)")
            hallsAndSessions = result
            view?.reloadTableView()
        }catch{
            hallsAndSessions = []
            view?.reloadTableView()
           
        }
    }
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.changeTitle(title: "Choose Cinema")
        view?.prepareCollectionView()
        view?.reloadCollectionView()
        view?.prepareTableView()
        view?.reloadTableView()
        
        Task {
            @MainActor in
            await fetchHallsAndSessions()
        }
    }
    
    
    func buyTicketButtonTapped() {
        router?.toChooseSeat(view: view)
    }
    
    func numberOfRowsInSection() -> Int {
        return hallsAndSessions.count
    }
    
    func cellForRow(at indexPath: IndexPath) -> HallAndSession {
        let hallAndSession = hallsAndSessions[indexPath.row]
        return hallAndSession
    }
}
