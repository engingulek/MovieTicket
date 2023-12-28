

import Foundation
import UIKit

final class FutureMovieCV : BaseCollectionView,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(resource: .background)
        collectionView.register(MovieCVC.self, 
                          forCellWithReuseIdentifier: MovieCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, 
                        numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, 
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieCVC.identifier,
            for: indexPath) as? MovieCVC else {return UICollectionViewCell()}
        
        cell.configureData(image: .movieTestImageTwo,
                        movieName: "Dune Part Two",
                        category: "Science Fiction")
        return cell
    }
}


extension FutureMovieCV {
    func collectionView(_ collectionView: UICollectionView, 
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width / 2, 
                   height: UIScreen.main.bounds.height / 3)
    }
}
