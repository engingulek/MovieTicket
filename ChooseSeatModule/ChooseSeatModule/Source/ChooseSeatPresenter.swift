
import Foundation
import ThemeKit
import ModelKit


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
    func addSelectedInfos(chooseInfo:SeatsInfo)
}


final class ChooseSeatPresenter : ChooseSeatPresenterInterface {

    var view: ChooseSeatViewControllerInterface?
    var router: ChooseSeatRouterInterface?
    var interactor: ChooseSeatInteractorProtocol
    var hallAndSessionId : Int?
    var languageId:Int?
    private var chooseHallAndSessionInfo:ChooseHallAndSessionInfo?
    private var hours:[Hour] = []
    private var fullSeatInfos : [SeatsInfo] = []
    private var selectedSeatInfos : [SeatsInfo] = []
    private var selectedHourId:Int = 0
    private var selecteedHour: String = ""
    
    
    init(view: ChooseSeatViewControllerInterface?,
        router: ChooseSeatRouterInterface? = nil,
         interactor : ChooseSeatInteractorProtocol = ChooseSeatInteractor.shared) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    private func fetchChooseHallAndSessionInfo() async {
        do{
            guard let hallAndSessionId = hallAndSessionId,
                  let languageId = languageId else {return}
            
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
        view?.changeTitle(title: Theme.theme.themeText.navTitleChooseSeat)
        Task {
            @MainActor in
            await fetchChooseHallAndSessionInfo()
            guard let info = chooseHallAndSessionInfo  else {return}
            view?.configureMovieInfo(info: info)
            await fetchSeatAndHoursInfo(chooseId: info.id)
            fullSeatInfos =  hours[0].seatsInfo
            selecteedHour = hours[0].hour
            view?.seatIndos(info: fullSeatInfos,selectedInfo:selectedSeatInfos)
        }
    }
    
    func toPaymentPage() {
        guard let info = chooseHallAndSessionInfo  else {return}
        
        if selectedSeatInfos.isEmpty {
            view?.createAlertMesssage(title: "Error",
                                    message: "Please Choose Seat(s)",
                                    actionTitle: "Ok")
        }else{
            let ticketInfo : [String:Any] = [
                "movieName" : info.movieName,
                "movieUrl": info.movieimageUrl,
                "hallNumber" :info.hallNumber,
                "date":info.date,
                "hour" : selecteedHour,
                "ticketAmount" : info.ticketAmount,
                "seats":selectedSeatInfos
            ]
            router?.toPaymentPage(view: view,ticketInfo: ticketInfo)
        }
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
        selectedSeatInfos = []
        selectedHourId = hours[indexPath.item].id
        selecteedHour = hours[indexPath.item].hour
        fullSeatInfos = hours[indexPath.item].seatsInfo
        view?.seatIndos(info: fullSeatInfos,selectedInfo:selectedSeatInfos)
        view?.reloadCollecionView()
    }
    
    func addSelectedInfos(chooseInfo: SeatsInfo) {
        // Do not click full seat
       let fullcontrol =  fullSeatInfos.contains {
           $0.row ==  chooseInfo.row && 
           $0.col == chooseInfo.col}
        if !fullcontrol {
            if let index = selectedSeatInfos.firstIndex(of: chooseInfo) {
                selectedSeatInfos.remove(at: index)
            } else {
                selectedSeatInfos.append(chooseInfo)
            }
            view?.seatIndos(info: fullSeatInfos,selectedInfo:selectedSeatInfos)
        }
    }
}
