
import Foundation
import ThemeKit


protocol ChooseSeatPresenterInterface {
    var view : ChooseSeatViewControllerInterface? {get}
    func viewDidLoad()
}


final class ChooseSeatPresenter : ChooseSeatPresenterInterface {
    var view: ChooseSeatViewControllerInterface?
    
    init(view: ChooseSeatViewControllerInterface?) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.prepareTableView()
        view?.reloadTableView()
        view?.prepareCollectionView()
        view?.reloadCollecionView()
    }
    
    
}
