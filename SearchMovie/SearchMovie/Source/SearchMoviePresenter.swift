
import Foundation
import ThemeKit


protocol SearchMoviePresenterInterface {
    var view : SearchMovieViewControllerInterface? {get}
    var router : SearchMovieRouterInterface? {get}
    func viewDidLoad()
}

class SearchMoviePresenter : SearchMoviePresenterInterface {
     var view: SearchMovieViewControllerInterface?
    var router: SearchMovieRouterInterface?
    init(view: SearchMovieViewControllerInterface?,
        router : SearchMovieRouterInterface? = nil ) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.navigationBarHidden(isHidden: false)
        view?.changeTintColor(color: Theme.theme.themeColor.primaryLabel)
        view?.changeTitle(title: "Search Movie")
        view?.prepareTableView()
        view?.relaodTableView()
    }
}
