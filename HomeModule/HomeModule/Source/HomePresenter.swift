import Foundation
import CommenUIKit

protocol HomePresenterInterface {
    var view : HomeViewControllerInterface? {get}
    
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func cellForItemAt(at indexPath: IndexPath) -> String
    func sizeForItemAt(at indexPath: IndexPath) -> CGSize
    func headerCollectionReuableView(at indexPath: IndexPath) -> String
    func referenceSizeForHeaderInSection() -> CGSize
}


final class HomePresenter : HomePresenterInterface {
    
   
    private let cellTypes : [String] = ["movieInCinemaCell","futureMovieCell","genresCell"]
    weak var view: HomeViewControllerInterface?
    
    init(view: HomeViewControllerInterface?) {
        self.view = view
    }
    
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .background)
        view?.prepareCollectionView()
        view?.reloadCollectionView()
    }
    
    
    func numberOfItemsInSection() -> Int {
        return 1
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> String {
        let cellType = cellTypes[indexPath.section]
        return cellType
    }
    
    func sizeForItemAt(at indexPath: IndexPath) -> CGSize {
        let cellType = cellTypes[indexPath.section]
        if cellType == "movieInCinemaCell" {
            return CGSize(width: UIScreenView.shared.screenWidth,
                          height: UIScreenView.shared.screenHeight / 2)
        }else if cellType == "futureMovieCell"{
            return CGSize(width: UIScreenView.shared.screenWidth,
                    height: UIScreenView.shared.screenHeight / 3)
        }else {
            return CGSize(width: UIScreenView.shared.screenWidth,
                            height: 80)
        }
    }
    
    
    func headerCollectionReuableView(at indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return "Movie In Cinema"
        }else if indexPath.section == 1{
            return "Future"
        }else{
            return "Genres"
        }
    }
    
    func referenceSizeForHeaderInSection() -> CGSize {
        return CGSize(width: UIScreenView.shared.screenWidth, height: 50)
    }
    
    
}