import Foundation
import CommenUIKit

protocol MovieDetailPresenterInterface {
    var view : MovieDetailViewControllerInterface? {get}
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func sizeForItemAt() -> CGSize
}

final class MovieDetailPresenter : MovieDetailPresenterInterface {
    weak var view : MovieDetailViewControllerInterface?
    
    init(view: MovieDetailViewControllerInterface? = nil) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .background)
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
