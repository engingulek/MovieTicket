import Foundation
import UIKit
import ThemeKit
import CommenUIKit
import ModelKit
import SnapKit


protocol  MovieInCinemaCVInterface : AnyObject {
    func realoadData()
    func startAnimatigIndicator()
    func stopAnimatingIndicator()
}

protocol MovieInCinemaCVDelegate {
    func selectedMovie(movie:MovieResult)
}

final class MovieInCinemaCV : BaseCollectionView {
    
    private lazy var movieInCinemaCollectionViewActivityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(hex:Theme.theme.themeColor.activityIndicatorColor)
        indicator.style = .large
        return indicator
    }()
    
    
    var delegate : MovieInCinemaCVDelegate?
    lazy var presenter : MovieInCinemaPresenterInterface = MovieInCinemaPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(movieInCinemaCollectionViewActivityIndicator)
        collectionView.backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        collectionView.register(PartnerCVC.self,
                        forCellWithReuseIdentifier: PartnerCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                }
        presenter.viewDidLoad()
        
        movieInCinemaCollectionViewActivityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

//MARK : CollectionViewDelegate and CollectionViewDataSource
extension MovieInCinemaCV {
    
      override func collectionView(_ collectionView: UICollectionView,
                            numberOfItemsInSection section: Int) -> Int {
          return presenter.numberOfItemsInSection()
      }
      
      override func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
          guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PartnerCVC.identifier,
            for: indexPath) as? PartnerCVC else {return UICollectionViewCell()}
          
          let movie = presenter.cellForItemAt(at: indexPath)
          cell.configureData(imageUrl:movie.imageURL,
                         firstText: movie.name,
                          secondaryText: "\(movie.genres.joined(separator: ", "))")
          return cell
      }
    
    override func collectionView(_ collectionView: UICollectionView,
                            didSelectItemAt indexPath: IndexPath) {
        let movie = presenter.didSelectItem(at: indexPath)
        self.delegate?.selectedMovie(movie: movie)
    }
}

//MARK : UICollectionViewDelegateFlowLayout
extension MovieInCinemaCV : UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 1.3, 
                  height: UIScreen.main.bounds.height / 2)
    }
}

//MARK :  MovieInCinemaCVInterface
extension MovieInCinemaCV : MovieInCinemaCVInterface {
    func realoadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            collectionView.reloadData()
        }
    }
    
    func startAnimatigIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            movieInCinemaCollectionViewActivityIndicator.startAnimating()
        }
    }
    
    func stopAnimatingIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            movieInCinemaCollectionViewActivityIndicator.stopAnimating()
        }
    }
}

