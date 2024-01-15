
import Foundation
import ThemeKit


protocol ChooseSeatPresenterInterface {
    var view : ChooseSeatViewControllerInterface? {get}
    var router : ChooseSeatRouterInterface? {get}
    func viewDidLoad()
    func toPaymentPage()
    func numberOfItemsInSection() -> Int
    func cellForItem(at indexPath:IndexPath) -> (hour:Hour,
                                        backColor:String,
                                        labelColor:String)
    func didSelectItem(at indexPath: IndexPath)
}


final class ChooseSeatPresenter : ChooseSeatPresenterInterface {
   
    
    var view: ChooseSeatViewControllerInterface?
    var router: ChooseSeatRouterInterface?
    var interactor: ChooseSeatInteractorProtocol
    var hallAndSessionId : Int?
    var languageId:Int?
    private var chooseHallAndSessionInfo:ChooseHallAndSessionInfo?
    private var hours:[Hour] = []
    private var selectedHourId:Int = 0
    
    
    init(view: ChooseSeatViewControllerInterface?,
        router: ChooseSeatRouterInterface? = nil,
         interactor : ChooseSeatInteractorProtocol = ChooseSeatInteractor.shared) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    private func fetchChooseHallAndSessionInfo() async {
        do{
            
            guard let hallAndSessionId = hallAndSessionId,let languageId = languageId else {return}
            let info = try await
            interactor.chooseHallAndSessionInfo(hallAndSessionId,languageId)
          
            chooseHallAndSessionInfo = info
          
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func fetchSeatAndHoursInfo(chooseId:Int) async {
        do{
            let result = try await interactor.hoursAndSeats(chooseId: chooseId)
            print("presenter \(result)")
            hours = result.hours
            view?.reloadCollecionView()
          
        }catch{
            hours = []
            view?.reloadCollecionView()
        }
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.prepareCollectionView()
        view?.reloadCollecionView()
        view?.changeTitle(title: "Choose Seat")
        Task {
            @MainActor in
            await fetchChooseHallAndSessionInfo()
            guard let info = chooseHallAndSessionInfo  else {return}
            view?.configureMovieInfo(info: info)
            print("tEAA \(info.id)")
            await fetchSeatAndHoursInfo(chooseId: info.id)
          //  print("tEAA \(seatAndHourInfo[0].hours.count)")
        }

    }
    
    
    func toPaymentPage() {
        router?.toPaymentPage(view: view)
    }
    
    func numberOfItemsInSection() -> Int {
        return hours.count
    }
    
    func cellForItem(at indexPath:IndexPath) -> (hour:Hour,
                                         backColor:String,
                                        labelColor:String){
        let hour:Hour
        let backColor:String
        let labelColor:String
        hour = hours[indexPath.item]
        if selectedHourId == hour.id {
            labelColor = Theme.theme.themeColor.thirdBack
            backColor = Theme.theme.themeColor.primaryLabel
        }else{
            labelColor = Theme.theme.themeColor.primaryLabel
            backColor = Theme.theme.themeColor.thirdBack
        }
        return (hour,backColor,labelColor)
    }
    
    func didSelectItem(at indexPath: IndexPath){
        selectedHourId = hours[indexPath.item].id
        view?.reloadCollecionView()
    }
    

    
}
