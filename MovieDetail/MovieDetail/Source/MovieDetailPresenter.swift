import Foundation
import CommenUIKit
import ThemeKit
import ModelKit
protocol MovieDetailPresenterInterface {
    var view : MovieDetailViewControllerInterface? {get}
    var router : MovieDetailRouterInterface? {get}
    func viewDidLoad()
 
    func numberOfItemsInSection() -> Int
    func sizeForItemAt() -> CGSize
    func cellForItem(at indexPath:IndexPath) -> Cast
    func configureData() -> MovieResult
    func toHallsAndSessions()
}

final class MovieDetailPresenter : MovieDetailPresenterInterface {
    var movieInfo: MovieResult?
    
    weak var view : MovieDetailViewControllerInterface?
    var router: MovieDetailRouterInterface?
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
        view?.changeTitle(title: "\(movieInfo?.name ?? "")")
       
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    func configureData() -> MovieResult {
        return movieInfo ?? MovieResult.defaultData
    }
    
    func numberOfItemsInSection() -> Int {
        return movieInfo?.cast.count ?? 0
    }
    
    func cellForItem(at indexPath:IndexPath) -> Cast {
        let cast = movieInfo?.cast[indexPath.item]
        return cast ?? MovieResult.defaultData.cast[0]
    }
    
    func sizeForItemAt() -> CGSize {
        return CGSize(width: UIScreenView.shared.screenWidth / 2,
                      height: UIScreenView.shared.screenHeight / 4)
    }
    
    func toHallsAndSessions() {
        router?.toHallsAndSessions(view: view)
    }
}







