

import Foundation
import UIKit
import CommenUIKit
final class FutureMovieCV : BaseCollectionView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(resource: .background)
        collectionView.register(PartnerCVC.self,
                                forCellWithReuseIdentifier: PartnerCVC.identifier)
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
            withReuseIdentifier: PartnerCVC.identifier,
            for: indexPath) as? PartnerCVC else {return UICollectionViewCell()}
        
        cell.configureData(
            image: .movieTestImageTwo,
            firstText: "Dune Part Two",
            secondaryText: "Science Fiction")
      
        return cell
    }
}


extension FutureMovieCV : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width / 2, 
                   height: UIScreen.main.bounds.height / 3)
    }
}
