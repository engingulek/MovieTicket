import Foundation
import CommenUIKit
import ThemeKit
import ModelKit

protocol HomePresenterInterface {
    var view : HomeViewControllerInterface? {get}
    
    func viewDidLoad()
    func viewWilAppear()
    
    func numberOfItemsInSection() -> Int
    func cellForItemAt(at indexPath: IndexPath) -> String
    func sizeForItemAt(at indexPath: IndexPath) -> CGSize
    func headerCollectionReuableView(at indexPath: IndexPath) -> String
    func referenceSizeForHeaderInSection() -> CGSize
    func selectedMovie(movie:MovieResult,buttonHidden:Bool)
    func textDidChange(text:String)
}


final class HomePresenter {
    
    private let cellTypes : [String] = ["movieInCinemaCell","futureMovieCell"]
    weak var view: HomeViewControllerInterface?
    private var router: HomeRouterInterface?
    
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
}

// MARK: HomePresenterInterface
extension HomePresenter : HomePresenterInterface {
    
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
            return CGSize(width: 0,
                      height: 0)
        }
    }
    
    
    func headerCollectionReuableView(at indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return Theme.theme.themeText.movieInCinema
        }else if indexPath.section == 1{
            return Theme.theme.themeText.future
        }else{
            return Theme.theme.themeText.defaultText
        }
    }
    
    func referenceSizeForHeaderInSection() -> CGSize {
        return CGSize(width: UIScreenView.shared.screenWidth, height: 50)
    }
    
    func selectedMovie(movie:MovieResult,buttonHidden:Bool) {
        router?.toMovieDetail(movie: movie,view: view,buttonHidden: buttonHidden)
    }
    
    func textDidChange(text: String) {
        if text.count > 4{
            router?.toSearchMovie(searchText: text, view: view)
            view?.textFieldAction()
        }
    }
}
