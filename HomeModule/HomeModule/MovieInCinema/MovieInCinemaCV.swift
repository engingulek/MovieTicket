

import Foundation
import UIKit

final class MovieInCinemaCV : BaseCollectionView,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(resource: .background)
        collectionView.register(MovieCVC.self, 
                        forCellWithReuseIdentifier: MovieCVC.identifier)
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
}


extension MovieInCinemaCV  {
    func collectionView(_ collectionView: UICollectionView, 
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 1.3, 
                  height: UIScreen.main.bounds.height / 2)
    }
    
   
}
