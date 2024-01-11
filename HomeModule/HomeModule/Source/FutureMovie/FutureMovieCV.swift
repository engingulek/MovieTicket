import Foundation
import UIKit
import CommenUIKit
import ThemeKit

protocol FutureMovieCVInterface : AnyObject {
    func realoadData()
}


final class FutureMovieCV : BaseCollectionView {
    lazy var presenter : FutureMoviePresenterInterface = FutureMoviePresenterr(view: self)
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
        let movie = presenter.cellForItemAt(at:indexPath)
        
        cell.configureData(
            imageUrl: movie.imageURL,
            firstText: "\(movie.name)",
            secondaryText: "\(movie.genres.joined(separator: ", "))")
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

extension FutureMovieCV : FutureMovieCVInterface {
    func realoadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            collectionView.reloadData()
        }
       
    }
}
