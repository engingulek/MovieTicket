import Foundation
import CommenUIKit
import ThemeKit
import ModelKit
protocol HomePresenterInterface {
    var view : HomeViewControllerInterface? {get}
    var router : HomeRouterInterface? {get}
    
    func viewDidLoad()
    func viewWilAppear()
    
    func numberOfItemsInSection() -> Int
    func cellForItemAt(at indexPath: IndexPath) -> String
    func sizeForItemAt(at indexPath: IndexPath) -> CGSize
    func headerCollectionReuableView(at indexPath: IndexPath) -> String
    func referenceSizeForHeaderInSection() -> CGSize
    func selectedMovie(movie:MovieResult)
    func textDidChange(text:String)
}


final class HomePresenter : HomePresenterInterface {
    
    private let cellTypes : [String] = ["movieInCinemaCell","futureMovieCell","genresCell"]
    weak var view: HomeViewControllerInterface?
    var router: HomeRouterInterface?
    
    init(view: HomeViewControllerInterface?,
         router:HomeRouterInterface? = nil) {
        self.view = view
        self.router = router
    }
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.navigationBarHidden(isHidden: true)
        
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    func viewWilAppear() {
        view?.navigationBarHidden(isHidden: true)
       
    }
    
    
    func numberOfItemsInSection() -> Int {
        return 1
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> String {
        let cellType = cellTypes[indexPath.section]
        return cellType
    }
    
    func sizeForItemAt(at indexPath: IndexPath) -> CGSize {
        let cellType = cellTypes[indexPath.section]
        if cellType == "movieInCinemaCell" {
            return CGSize(width: UIScreenView.shared.screenWidth,
                          height: UIScreenView.shared.screenHeight / 2)
        }else if cellType == "futureMovieCell"{
            return CGSize(width: UIScreenView.shared.screenWidth,
                    height: UIScreenView.shared.screenHeight / 3)
        }else {
            return CGSize(width: UIScreenView.shared.screenWidth,
                            height: 80)
        }
    }
    
    
    func headerCollectionReuableView(at indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return "Movie In Cinema"
        }else if indexPath.section == 1{
            return "Future"
        }else{
            return "Genres"
        }
    }
    
    func referenceSizeForHeaderInSection() -> CGSize {
        return CGSize(width: UIScreenView.shared.screenWidth, height: 50)
    }
    
    func selectedMovie(movie:MovieResult) {
        router?.toMovieDetail(movie: movie,view: view)
    }
    
    func textDidChange(text: String) {
        if text.count > 3{
            router?.toSearchMovie(view: view)
            view?.textFieldAction()
        }
    }
}

