import Foundation
import UIKit
import CommenUIKit
import ThemeKit

protocol GenresCVInterface : AnyObject {
    var presenter : GenresPresenterInterface {get}
    func realoadData()
}


final class GenresCV : BaseCollectionView,UICollectionViewDelegateFlowLayout {
    lazy var presenter: GenresPresenterInterface = GenresPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        collectionView.register(OnlyLabelCVC.self,
                          forCellWithReuseIdentifier: OnlyLabelCVC.identifier)
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
            withReuseIdentifier: OnlyLabelCVC.identifier,
            for: indexPath) as? OnlyLabelCVC else {return UICollectionViewCell()}
        let genreName = presenter.cellForItemAt(at: indexPath).name ?? ""
        cell.configureData(labelText:genreName)
        cell.configureIU(
            backColor: Theme.theme.themeColor.secondaryBack, 
            labelColor: Theme.theme.themeColor.primaryLabel,
            font: Theme.theme.themeFont.cellLabelFont.boldVersion)
        cell.contentView.clipsToBounds = true
        cell.contentView.layer.cornerRadius = Radius.small.rawValue
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

extension  GenresCV : GenresCVInterface {
    func realoadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            collectionView.reloadData()
        }
       
    }
    
    
}
