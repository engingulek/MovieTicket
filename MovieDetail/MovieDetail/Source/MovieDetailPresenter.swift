import Foundation
import CommenUIKit
import ThemeKit
import ModelKit
protocol MovieDetailPresenterInterface {
    var view : MovieDetailViewControllerInterface? {get}
    
    func viewDidLoad()
    
    func numberOfItemsInSection() -> Int
    func sizeForItemAt() -> CGSize
    func cellForItem(at indexPath:IndexPath) -> Cast
    func configureData() -> MovieResult
    func toHallsAndSessions()
}

final class MovieDetailPresenter : MovieDetailPresenterInterface {
    var movieInfo: MovieResult = MovieResult.defaultData
    var buttonHidde:Bool = true
    
    weak var view : MovieDetailViewControllerInterface?
    private var router: MovieDetailRouterInterface?
    init(view: MovieDetailViewControllerInterface?,
         router:MovieDetailRouterInterface? = nil
    ) {
        self.view = view
        self.router = router
        
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.navigationBarHidden(isHidden: false)
        view?.changeNavBarColor(color: Theme.theme.themeColor.primaryBackground)
        view?.changeTintColor(color: Theme.theme.themeColor.primaryLabel)
        view?.changeTitle(title: movieInfo.name)
        
        view?.prepareCollectionView()
        view?.reloadCollectionView()
        view?.buttonHiddenAction(buttonHidden: buttonHidde)
    }
    
    func configureData() -> MovieResult {
        return movieInfo
    }
    
    func numberOfItemsInSection() -> Int {
        return movieInfo.cast.count
    }
    
    func cellForItem(at indexPath:IndexPath) -> Cast {
        let cast = movieInfo.cast[indexPath.item]
        return cast
    }
    
    func sizeForItemAt() -> CGSize {
        return CGSize(width: UIScreenView.shared.screenWidth / 2,
                   height: UIScreenView.shared.screenHeight / 4)
    }
    
    func toHallsAndSessions() {
        let id = movieInfo.id
        router?.toHallsAndSessions(view: view,movieId: id)
    }
}

