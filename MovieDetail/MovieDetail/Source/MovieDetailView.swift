
import Foundation
import UIKit
import CommenUIKit
import ThemeKit
import ModelKit
import Kingfisher
protocol MovieDetailViewDelegate {
    func chooseCinema()
}

final class MovieDetailView : UIView {
    var delegate : MovieDetailViewDelegate?
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var  scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        view.backgroundColor = Theme.theme.themeColor.primaryBackground
        return view
    }()
    
    
    private lazy var movieImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        return label
    }()
    
    private lazy var movieGenresLabel : UILabel = {
        let label = UILabel()
        label.textColor = Theme.theme.themeColor.secondaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont
        return label
    }()
    
    private lazy var movieDirectorNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = Theme.theme.themeColor.secondaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont
        return label
    }()
    
    private lazy var movieTime : UILabel = {
        let label = UILabel()
        label.textColor = Theme.theme.themeColor.secondaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont
        return label
    }()
    
    private lazy var movieInfoTitle: UILabel = {
        let label = UILabel()
        label.text = "Movie Info"
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        return label
    }()
    
    private lazy var movieInfo : UILabel = {
        let label = UILabel()
        label.textColor = Theme.theme.themeColor.secondaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var showMoreButton : UIButton = {
        let button = UIButton()
        button.setTitle("Show More", for: .normal)
        button.setTitleColor(Theme.theme.themeColor.primaryLabel, for: .normal)
        button.titleLabel?.textAlignment = .left
        return  button
        
    }()
    
    private lazy var castTitle: UILabel = {
        let label = UILabel()
        label.text = "Casts"
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        return label
    }()
    
    private lazy var castcollectionview : UICollectionView  = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 5,
                                 height:UIScreen.main.bounds.height / 15 )
        layout.scrollDirection = .horizontal
        let  collectionview = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        collectionview.register(
            PartnerCVC.self,
            forCellWithReuseIdentifier: PartnerCVC.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = Theme.theme.themeColor.primaryBackground
        return collectionview
    }()
    
    private lazy var chooseCinemaButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose Cinema", for: .normal)
        button.setTitleColor(Theme.theme.themeColor.primaryLabel, for: .normal)
        button.titleLabel?.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        button.backgroundColor = Theme.theme.themeColor.thirdBack
        button.titleLabel?.textAlignment = .left
        button.layer.cornerRadius = Radius.small.rawValue
        button.addAction(chooseCinemaButtonTapped, for: .touchUpInside)
        return  button
    }()
    
    private lazy var chooseCinemaButtonTapped : UIAction = UIAction { _ in
        self.delegate?.chooseCinema()
        
    }
    
    func prepareCollectionViewDelegate(view:MovieDetailViewController){
        castcollectionview.delegate = view
        castcollectionview.dataSource = view
    }
    
    func collectionViewReload(){
        castcollectionview.reloadData()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(movie:MovieResult){
        let url = URL(string: movie.detailImageURL)
        movieImageView.kf.setImage(
                   with: url,
               options: [.transition(.fade(1))])
        
        movieNameLabel.text = movie.name
        movieGenresLabel.text = movie.genres.joined(separator: ", ")
        movieDirectorNameLabel.text = movie.director
        movieTime.text = "\(movie.year)  \(movie.runtime) mn"
        movieInfo.text = movie.movieInfo
        
    }
    
     func buttonHiddenAction(buttonHidden:Bool){
         chooseCinemaButton.isHidden = buttonHidden
    }
    
    private func configureUI(){
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        scrollView.addSubview(scrollStackViewContainer)
        scrollStackViewContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        [movieImageView,
         movieNameLabel,
         movieGenresLabel,
         movieDirectorNameLabel,
         movieTime,
         movieInfoTitle,
         movieInfo,
         showMoreButton,
         castTitle,
         castcollectionview].forEach { view in
            scrollStackViewContainer.addArrangedSubview(view)
        }
        
        movieImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height/3 )
        }
        [movieNameLabel,
         movieGenresLabel,
         movieDirectorNameLabel,
         movieTime,
         movieInfoTitle,
         castTitle].forEach { view in
            view.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(10)
            }
        }
        
        
        movieInfo.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(UIScreen.main.bounds.height / 5)
        }
        
        castcollectionview.snp.makeConstraints { make in
            
            make.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        
        addSubview(chooseCinemaButton)
        chooseCinemaButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-5)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(60)
        }
    }
}
