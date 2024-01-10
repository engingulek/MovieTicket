import Foundation
import UIKit
import ThemeKit
import CommenUIKit
protocol MovieInCinemaCVDelegate {
    func selectedMovie()
    
}

protocol  MovieInCinemaCVInterface : AnyObject {
    func realoadData()
}

final class MovieInCinemaCV : BaseCollectionView,UICollectionViewDelegateFlowLayout {
    var delegate : MovieInCinemaCVDelegate?
    lazy var presenter : MovieInCinemaPresenterInterface = MovieInCinemaPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = Theme.theme.themeColor.primaryBackground
        collectionView.register(PartnerCVC.self,
                        forCellWithReuseIdentifier: PartnerCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                }
        
        presenter.viewDidLoad()
    }
    
    
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
          //cell.configureData(image: .movieTest, movieName: movie.name ?? "", category: "\(movie.genres?.joined(separator: ", ") ?? "")")
         cell.configureData(imageUrl:movie.imageUrl ?? "",
                             firstText: movie.name ?? "",
                             secondaryText: "\(movie.genres?.joined(separator: ", ") ?? "")")
          return cell
      }
    
    override func collectionView(_ collectionView: UICollectionView, 
                            didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectedMovie()
    }
}


extension MovieInCinemaCV  {
    func collectionView(_ collectionView: UICollectionView, 
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 1.3, 
                  height: UIScreen.main.bounds.height / 2)
    }
}


extension MovieInCinemaCV : MovieInCinemaCVInterface {
    func realoadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            collectionView.reloadData()
        }
       
    }
}
