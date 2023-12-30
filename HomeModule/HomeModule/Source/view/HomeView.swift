import Foundation
import UIKit
import ThemeKit
final class HomeView : UIView {
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Hi,Engin"
        label.textColor = Theme.theme.themeColor.secondaryLabel
        label.font =  Theme.theme.themeFont.primaryFont.boldVersion
        return label
    }()
    
    private lazy var userImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .user)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50/2
        return imageView
    }()
    
    private lazy var searhTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search Movie"
        textField.backgroundColor = Theme.theme.themeColor.secondaryBack
        textField.textColor = Theme.theme.themeColor.secondaryLabel
        return textField
    }()
    
    private lazy var searchIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = Theme.theme.themeColor.secondaryLabel
        return image
    }()
    
    private lazy var searchView : UIView = {
        let uiview = UIView()
        uiview.layer.cornerRadius = Radius.small.rawValue
        uiview.backgroundColor = Theme.theme.themeColor.secondaryBack
        return uiview
    }()
    
    
    
    private lazy var movieListCollectionView : UICollectionView  = {
     let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
     layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
     
     layout.scrollDirection = .vertical
     let  collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = Theme.theme.themeColor.primaryBackground
     return collectionview
     }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        
        movieListCollectionView.register(
            MovieListCVCForFuture.self,
            forCellWithReuseIdentifier: MovieListCVCForFuture.idetifier)
        movieListCollectionView.register(
            MovieListCVCForInCineme.self,
            forCellWithReuseIdentifier: MovieListCVCForInCineme.idetifier)
        movieListCollectionView.register(
            MovieListCVCForGenre.self,
            forCellWithReuseIdentifier: MovieListCVCForGenre.idetifier)
        movieListCollectionView.register(
            HeaderCollectionReuableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionReuableView.identifier)
    }
    
    func prepareCollectionView(view:HomeViewController){
        movieListCollectionView.delegate = view
        movieListCollectionView.dataSource = view
    }
    
    func reloadCollectionView(){
        movieListCollectionView.reloadData()
    }
    
    func returnMovieListCollectionView() -> UICollectionView {
        return  movieListCollectionView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI(){
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }
        
        searchView.addSubview(searchIcon)
        searchIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        searchView.addSubview(searhTextField)
        searhTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(searchIcon.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        addSubview(movieListCollectionView)
        movieListCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    
    
}
