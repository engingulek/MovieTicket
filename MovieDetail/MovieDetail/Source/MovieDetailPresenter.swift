import Foundation
import CommenUIKit

protocol MovieDetailPresenterInterface {
    var view : MovieDetailViewControllerInterface? {get}
    var router : MovieDetailRouterInterface? {get}
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func sizeForItemAt() -> CGSize
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
        view?.setBackColorAble(color: .background)
        view?.navigationBarHidden(isHidden: false)
        view?.changeNavBarColor(color: .background)
        view?.changeTintColor(color: .white)
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
}
