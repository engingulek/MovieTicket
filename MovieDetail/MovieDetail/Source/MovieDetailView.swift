
import Foundation
import UIKit
import CommenUIKit
final class MovieDetailView : UIView {
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var  scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        view.backgroundColor = UIColor(resource:.background)
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
        label.textColor = .white
        label.font = .systemFont(ofSize: 25,weight: .bold)
        return label
    }()
    
    private lazy var movieGenresLabel : UILabel = {
        let label = UILabel()
        label.text = "Action,Drama"
        label.textColor = UIColor(resource: .primaryLabel)
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        return label
    }()
    
    private lazy var movieDirectorNameLabel : UILabel = {
        let label = UILabel()
        label.text = "2025,Denis Villeneuve"
        label.textColor = UIColor(resource: .primaryLabel)
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        return label
    }()
    
    private lazy var movieTime : UILabel = {
        let label = UILabel()
        label.text = "Runtime : 1h 45min"
        label.textColor = UIColor(resource: .primaryLabel)
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        return label
    }()
    
    private lazy var movieInfoTitle: UILabel = {
        let label = UILabel()
        label.text = "Movie Info"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20,weight: .bold)
        return label
    }()
    
    private lazy var movieInfo : UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
        label.textColor = UIColor(resource: .primaryLabel)
        label.font = .systemFont(ofSize: 19,weight: .semibold)
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var showMoreButton : UIButton = {
        let button = UIButton()
        button.setTitle("Show More", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.textAlignment = .left
        return  button
        
    }()
    
    private lazy var castTitle: UILabel = {
        let label = UILabel()
        label.text = "Casts"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20,weight: .bold)
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
        collectionview.backgroundColor = UIColor(resource: .background)
        return collectionview
    }()
    
    private lazy var buyTicletButton : UIButton = {
        let button = UIButton()
        button.setTitle("Buy Ticket", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20,weight: .semibold)
        button.backgroundColor =  UIColor(resource: .secondaryBack)
        button.titleLabel?.textAlignment = .left
        button.layer.cornerRadius = 10
        return  button
    }()
    
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