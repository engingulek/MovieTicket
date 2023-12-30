import Foundation
import UIKit
import ThemeKit

protocol MovieInCinemaCVDelegate {
    func selectedMovie()
}

final class MovieInCinemaCV : BaseCollectionView,UICollectionViewDelegateFlowLayout {
    var delegate : MovieInCinemaCVDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = Theme.theme.themeColor.primaryBackground
        collectionView.register(MovieCVC.self,
                        forCellWithReuseIdentifier: MovieCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                }
    }
    
    
      override func collectionView(_ collectionView: UICollectionView, 
                            numberOfItemsInSection section: Int) -> Int {
          return 10
      }
      
      override func collectionView(_ collectionView: UICollectionView, 
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
          guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieCVC.identifier,
            for: indexPath) as? MovieCVC else {return UICollectionViewCell()}
          cell.configureData(image: .movieTest, 
                        movieName: "Joker",
                        category: "Crime,Drama")
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
