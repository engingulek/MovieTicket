
import Foundation


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
        view?.setBackColorAble(color:.background)
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    
    
}
