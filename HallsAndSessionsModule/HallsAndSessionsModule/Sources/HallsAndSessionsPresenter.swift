
import Foundation
import ThemeKit

protocol HallsAndSessionsPresenterInterface {
    var view: HallsAndSessionsViewControllerInterface? {get}
    var router : HallsAndSessionsRouterInterface? {get}
    func viewDidLoad()
    /// For HallsAndSession TableView
    func buyTicketButtonTapped()
    func numberOfRowsInSection() -> Int
    func cellForRow(at indexPath : IndexPath) -> HallAndSession
    ///For Date Collection View
    func numberOfItemsInSection() -> Int
    func cellForItem(at indexPath : IndexPath) -> (date:String,
                                          backColor:String,
                                          labelColor:String)
    func didSelectItem(at indexPath : IndexPath )
}

final class HallsAndSessionsPresenter : HallsAndSessionsPresenterInterface {
    private var dataList : [String] = []
    private var hallsAndSessions : [HallAndSession] = []
    private var selectedDate:String = ""
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
    
    private func fetchHallsAndSessions(selectedDate:String) async {
       
        do {
            let result = try await interactor.filterHallsAndSessionsFilterDate(movieId: movieId, date: selectedDate)
            print("Halll \(result.count)")
            hallsAndSessions = result
            view?.reloadTableView()
        }catch{
            hallsAndSessions = []
            view?.reloadTableView()
           
        }
    }
    
  
    
    func dateFormantter(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let formatted = dateFormatter.string(from: date)
        return formatted
    }
    
    private func futureDateCalculater(){
        let currentDate = Date()
        let calendar = Calendar.current
       
       
            for i in 0..<5 {
                if let date = calendar.date(byAdding: .day, value: i, to: currentDate) {
                    let formantDate = dateFormantter(date: date)
                    dataList.append(formantDate)
                }
            }
    }
    
   
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.changeTitle(title: "Choose Cinema")
        view?.prepareCollectionView()
        view?.reloadCollectionView()
        view?.prepareTableView()
        view?.reloadTableView()
        futureDateCalculater()
        selectedDate = dateFormantter(date: Date())
        
        Task {
            @MainActor in
            await fetchHallsAndSessions(selectedDate: selectedDate)
        }
       
       
       
        
        print(hallsAndSessions.count)

        
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
    
    
    func numberOfItemsInSection() -> Int {
        return dataList.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (date:String,
                                          backColor:String,
                                          labelColor:String) {
        let date:String
        let backColor:String
        let labelColor:String
        date = dataList[indexPath.item]
        if date == selectedDate {
            labelColor = Theme.theme.themeColor.thirdBack
            backColor = Theme.theme.themeColor.primaryLabel
        }else{
            labelColor = Theme.theme.themeColor.primaryLabel
            backColor = Theme.theme.themeColor.thirdBack
            
        }
        return (date,backColor,labelColor)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let selected = dataList[indexPath.item]
        selectedDate = selected
        view?.reloadCollectionView()
        Task {
            @MainActor in
            await fetchHallsAndSessions(selectedDate: selectedDate)
        }
    }
}
