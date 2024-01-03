import UIKit
import SnapKit
import CommenUIKit
import ViewControllerAbleKit

typealias Ables = UIViewAble & NavConUIAble & SegueAble & TabbarConAble

protocol MovieDetailViewControllerInterface : AnyObject,Ables {
    var presenter : MovieDetailPresenterInterface {get}
    func prepareCollectionView()
    func reloadCollectionView()
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
    }
}


extension  MovieDetailViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PartnerCVC.identifier,
            for: indexPath) as? PartnerCVC else {return UICollectionViewCell()}
        cell.configureData(image: .castImages,
                           firstText: "Timothée Chalamet",
                           secondaryText: "Paul Atredies")
        
        return cell
    }
}


extension MovieDetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return presenter.sizeForItemAt()
    }
}

extension MovieDetailViewController : MovieDetailViewControllerInterface {
    
    func prepareCollectionView() {
        movieDetailView.prepareCollectionViewDelegate(view: self)
    }
    
    func reloadCollectionView() {
        movieDetailView.collectionViewReload()
    }
}

extension MovieDetailViewController : MovieDetailViewDelegate {
    func buyTicketButtonTapped() {
        presenter.toHallsAndSessions()
    }
    
    
}
