

import Foundation
import UIKit
import CommenUIKit
final class GenresCV : BaseCollectionView,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(resource: .background)
        collectionView.register(OnlyLabelCVC.self,
                          forCellWithReuseIdentifier: OnlyLabelCVC.identifier)
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
            withReuseIdentifier: OnlyLabelCVC.identifier,
            for: indexPath) as? OnlyLabelCVC else {return UICollectionViewCell()}
        cell.configureData(labelText: "Action")
        cell.configureIU(backColor: UIColor(resource: .secondatyBack), ofSize: 20)
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
