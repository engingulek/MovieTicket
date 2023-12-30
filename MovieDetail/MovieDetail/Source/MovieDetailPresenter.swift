import Foundation
import CommenUIKit
import ThemeKit
protocol MovieDetailPresenterInterface {
    var view : MovieDetailViewControllerInterface? {get}
    var router : MovieDetailRouterInterface? {get}
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func sizeForItemAt() -> CGSize
    func toHallsAndSessions()
}

final class MovieDetailPresenter : MovieDetailPresenterInterface {
   
    
    weak var view : MovieDetailViewControllerInterface?
    var router: MovieDetailRouterInterface?
    init(view: MovieDetailViewControllerInterface?,
         router:MovieDetailRouterInterface? = nil) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.navigationBarHidden(isHidden: false)
        view?.changeNavBarColor(color: Theme.theme.themeColor.primaryBackground)
        view?.changeTintColor(color: Theme.theme.themeColor.primaryLabel)
        view?.changeTitle(title: "Movie Detail")
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    func numberOfItemsInSection() -> Int {
        return 10
    }
    
    func sizeForItemAt() -> CGSize {
        return CGSize(width: UIScreenView.shared.screenWidth / 2.5,
                      height: UIScreenView.shared.screenHeight / 4)
    }
    
    func toHallsAndSessions() {
        router?.toHallsAndSessions(view: view)
    }
}
