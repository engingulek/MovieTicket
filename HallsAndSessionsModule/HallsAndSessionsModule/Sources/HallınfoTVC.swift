
import Foundation
import UIKit
import SnapKit
import CommenUIKit
final class HallInfoTVC : UITableViewCell {
    static let identifier = "hallInfoTVC"
    
    private lazy var locIcon : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.and.ellipse")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var cinemaNameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var hallNumberLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20,weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var movieLanguageLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20,weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var timeollectionview : UICollectionView  = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
       
        layout.scrollDirection = .horizontal
        let  collectionview = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        collectionview.register(
            OnlyLabelCVC.self,
            forCellWithReuseIdentifier: OnlyLabelCVC.identifier)
    
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = UIColor(resource: .background)
        return collectionview
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor =  UIColor(resource: .background)
        
        timeollectionview.delegate = self
        timeollectionview.dataSource = self
        timeollectionview.reloadData()
        
        contentView.addSubview(locIcon)
        locIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        contentView.addSubview(cinemaNameLabel)
        cinemaNameLabel.snp.makeConstraints { make in
            make.top.equalTo(locIcon.snp.top)
            make.leading.equalTo(locIcon.snp.trailing).offset(10)
        }
        
        contentView.addSubview(hallNumberLabel)
        hallNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(locIcon.snp.top)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        contentView.addSubview(movieLanguageLabel)
        movieLanguageLabel.snp.makeConstraints { make in
            make.top.equalTo(cinemaNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(25)
        }
        contentView.addSubview(timeollectionview)
        timeollectionview.snp.makeConstraints { make in
            make.top.equalTo(movieLanguageLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    
    func configureData(cinemaName:String,
                hallNumber:String,
                movieLanguage:String){
        cinemaNameLabel.text = cinemaName
        hallNumberLabel.text = hallNumber
        movieLanguageLabel.text = movieLanguage
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HallInfoTVC : UICollectionViewDelegate,UICollectionViewDataSource {
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 3
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyLabelCVC.identifier, for: indexPath) as? OnlyLabelCVC else {return UICollectionViewCell()}
            cell.configureData(labelText: "12:40")
            cell.configureIU(backColor: .secondaryBack, ofSize: 18)
            return cell
        }
    }

extension HallInfoTVC :  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 4 ,
                  height: 40)
    }
}

