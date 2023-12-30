
import Foundation
import ThemeKit

protocol HallsAndSessionsPresenterInterface {
    var view: HallsAndSessionsViewControllerInterface? {get}
    func viewDidLoad()
    
}

final class HallsAndSessionsPresenter : HallsAndSessionsPresenterInterface {
    var view: HallsAndSessionsViewControllerInterface?
    
    init(view: HallsAndSessionsViewControllerInterface?) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.prepareCollectionView()
        view?.reloadCollectionView()
        view?.prepareTableView()
        view?.reloadTableView()
    }
    
    
    
}
