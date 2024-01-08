
import Foundation
import ThemeKit


protocol SearchMoviePresenterInterface {
    var view : SearchMovieViewControllerInterface? {get}
    func viewDidLoad()
}

class SearchMoviePresenter : SearchMoviePresenterInterface {
     var view: SearchMovieViewControllerInterface?
    init(view: SearchMovieViewControllerInterface? = nil) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.prepareTableView()
        view?.relaodTableView()
    }
    
    
}
