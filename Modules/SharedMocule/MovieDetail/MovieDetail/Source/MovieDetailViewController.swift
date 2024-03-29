import UIKit
import SnapKit
import CommenUIKit
import ViewControllerAbleKit
import ModelKit

typealias Ables = UIViewAble & NavConUIAble & SegueAble

protocol MovieDetailViewControllerInterface : AnyObject,Ables {
    var presenter : MovieDetailPresenterInterface {get}
    func prepareCollectionView()
    func reloadCollectionView()
    func buttonHiddenAction(buttonHidden:Bool)
}

final class MovieDetailViewController : UIViewController {
    lazy var presenter: MovieDetailPresenterInterface  = MovieDetailPresenter(view: self)
    private lazy var movieDetailView = MovieDetailView()
    
    override func loadView() {
        view = movieDetailView
        movieDetailView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        movieDetailView.configureData(movie:presenter.configureData())
    }
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension  MovieDetailViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PartnerCVC.identifier,
            for: indexPath) as? PartnerCVC else {return UICollectionViewCell()}
        let cast = presenter.cellForItem(at: indexPath)
        cell.configureData(imageUrl:cast.imageURL,
                           firstText: cast.name,
                           secondaryText: cast.role)
        
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension MovieDetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return presenter.sizeForItemAt()
    }
}

//MARK: MovieDetailViewControllerInterface
extension MovieDetailViewController : MovieDetailViewControllerInterface {
    func prepareCollectionView() {
        movieDetailView.prepareCollectionViewDelegate(view: self)
    }
    
    func reloadCollectionView() {
        movieDetailView.collectionViewReload()
    }
    
    func buttonHiddenAction(buttonHidden: Bool) {
        movieDetailView.buttonHiddenAction(buttonHidden: buttonHidden)
    }
}

//MARK: MovieDetailViewDelegate
extension MovieDetailViewController : MovieDetailViewDelegate {
    func chooseCinema() {
        presenter.toHallsAndSessions()
    }
}


