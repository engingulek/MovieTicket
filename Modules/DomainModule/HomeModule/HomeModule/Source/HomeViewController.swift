import UIKit
import SnapKit
import ViewControllerAbleKit
import ModelKit
import MovieDetail

typealias Ables = UIViewAble & SegueAble & NavConUIAble

protocol HomeViewControllerInterface : AnyObject,Ables {
    
   // var presenter : HomePresenterInterface {get}
    func prepareCollectionView()
    func reloadCollectionView()
    func textFieldAction(text:String)
}

final class HomeViewController: UIViewController {
    
    lazy var presenter: HomePresenterInterface = HomePresenter(view: self)
    private lazy var homeView = HomeView()
   
    private let cellTypes : [String] = ["movieInCinemaCell","futureMovieCell"]
    override func loadView() {
        view = homeView
        homeView.prepareTextField(view: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWilAppear()
    }
}

//MARK:  HomeViewControllerInterface
extension HomeViewController : HomeViewControllerInterface {
 
    func prepareCollectionView() {
        homeView.prepareCollectionView(view: self)
    }
    
    func reloadCollectionView() {
        homeView.reloadCollectionView()
    }
    
    func textFieldAction(text:String) {
        homeView.textFieldTextRemove(text:text)
    }
}

// MARK : UICollectionViewDelegate,UICollectionViewDataSource
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellType = presenter.cellForItemAt(at: indexPath)
        
        if cellType == "movieInCinemaCell" {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieListCVCForInCineme.idetifier,
                for: indexPath) as? MovieListCVCForInCineme 
            else {return UICollectionViewCell()}
            cell.delegate = self
            return cell
            
        }else if cellType == "futureMovieCell"{
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieListCVCForFuture.idetifier,
                for: indexPath) as? MovieListCVCForFuture 
            else {return UICollectionViewCell()}
            cell.delegate = self
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.numberOfSection()
    }
}

//MARK: MovieListCVCForInCinemeDelegate
extension HomeViewController : MovieListCVCForInCinemeDelegate {
    func selectedMovieInCinema(movie:MovieResult) {
        presenter.selectedMovie(movie: movie,buttonHidden: false)
    }
}

//MARK: MovieListCVCForFutureDelegate
extension HomeViewController : MovieListCVCForFutureDelegate{
    func selectedFutureMovie(movie: MovieResult) {
        presenter.selectedMovie(movie: movie,buttonHidden: true)
    }
}

//MARK: UITextFieldDelegate
extension HomeViewController :  UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            presenter.textDidChange(text: text)
        }
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = presenter.sizeForItemAt(at: indexPath)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderCollectionReuableView.identifier,
                for: indexPath) as? HeaderCollectionReuableView
                    
            else {return UICollectionReusableView()}
            
            let title = presenter.headerCollectionReuableView(at: indexPath)
            header.configureData(title: title)
            return header
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = presenter.referenceSizeForHeaderInSection()
        return size
    }
}
