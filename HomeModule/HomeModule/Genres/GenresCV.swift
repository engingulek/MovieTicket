

import Foundation
import UIKit

final class GenresCV : BaseCollectionView,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(resource: .background)
        collectionView.register(GenreCVC.self,
                          forCellWithReuseIdentifier: GenreCVC.identifier)
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
            withReuseIdentifier: GenreCVC.identifier,
            for: indexPath) as? GenreCVC else {return UICollectionViewCell()}
        cell.configureData(genreName: "Action")
        cell.contentView.clipsToBounds = true
        cell.contentView.layer.cornerRadius = 10
        return cell
    }
}


extension GenresCV {
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width / 2.5,
                   height: 80)
    }
}
