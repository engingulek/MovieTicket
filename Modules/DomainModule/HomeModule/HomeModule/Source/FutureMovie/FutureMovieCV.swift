import Foundation
import UIKit
import CommenUIKit
import ThemeKit
import ModelKit

// MARK: - FutureMovieCVInterface
protocol FutureMovieCVInterface : AnyObject {
    func messageWithLabel(text:String)
    func realoadData()
    func startAnimatigIndicator()
    func stopAnimatingIndicator()
}

// MARK: - FutureMovieCVDelegate
protocol FutureMovieCVDelegate {
    func selectedMovie(movie:MovieResult)
}

final class FutureMovieCV : BaseCollectionView {
    
    var delegate : FutureMovieCVDelegate?
    lazy var presenter : FutureMoviePresenterInterface = FutureMoviePresenterr(view: self)
    
    private lazy var movieListEmpty :  UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.font = Theme.theme.themeFont.cellLabelFont
        label.textColor = UIColor(hex: Theme.theme.themeColor.primaryLabel)
        return label
    }()
    
    private lazy var futureMovieCollectionViewActivityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(hex:Theme.theme.themeColor.activityIndicatorColor)
        indicator.style = .large
        return indicator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(futureMovieCollectionViewActivityIndicator)
        collectionView.addSubview(movieListEmpty)
        collectionView.backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        collectionView.register(PartnerCVC.self,
                         forCellWithReuseIdentifier: PartnerCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        presenter.viewDidLoad()
        movieListEmpty.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        futureMovieCollectionViewActivityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

// MARK: -FutureMovieCV Delegate Datasousce
extension FutureMovieCV {
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

//MARK: UICollectionViewDelegateFlowLayout
extension FutureMovieCV : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width / 2, 
                   height: UIScreen.main.bounds.height / 3)
    }
}

//MARK: FutureMovieCVInterface
extension FutureMovieCV : FutureMovieCVInterface {
    func messageWithLabel(text:String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            movieListEmpty.isHidden = false
            movieListEmpty.text = text
        }
      
    }
   
    func realoadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            collectionView.reloadData()
        }
    }
    
    func startAnimatigIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            futureMovieCollectionViewActivityIndicator.startAnimating()
        }
    }
    
    func stopAnimatingIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            futureMovieCollectionViewActivityIndicator.stopAnimating()
        }
    }
    
}
