
import Foundation
import UIKit
import CommenUIKit
import ThemeKit
protocol MovieDetailViewDelegate {
    func buyTicketButtonTapped()
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
        imageView.image = UIImage(resource: .movieImageThird)
        return imageView
    }()
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Dune Part Two"
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        return label
    }()
    
    private lazy var movieGenresLabel : UILabel = {
        let label = UILabel()
        label.text = "Action,Drama"
        label.textColor = Theme.theme.themeColor.secondaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont
        return label
    }()
    
    private lazy var movieDirectorNameLabel : UILabel = {
        let label = UILabel()
        label.text = "2025,Denis Villeneuve"
        label.textColor = Theme.theme.themeColor.secondaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont
        return label
    }()
    
    private lazy var movieTime : UILabel = {
        let label = UILabel()
        label.text = "Runtime : 1h 45min"
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
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
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
    
    private lazy var buyTicletButton : UIButton = {
        let button = UIButton()
        button.setTitle("Buy Ticket", for: .normal)
        button.setTitleColor(Theme.theme.themeColor.primaryLabel, for: .normal)
        button.titleLabel?.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        button.backgroundColor = Theme.theme.themeColor.thirdBack
        button.titleLabel?.textAlignment = .left
        button.layer.cornerRadius = Radius.small.rawValue
        button.addAction(buyTicketButtonTapped, for: .touchUpInside)
        return  button
    }()
    
    private lazy var buyTicketButtonTapped : UIAction = UIAction { _ in
        self.delegate?.buyTicketButtonTapped()
        
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
        
        addSubview(buyTicletButton)
        buyTicletButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-5)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.height.equalTo(60)
        }
    }
}
