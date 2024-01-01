
import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ThemeKit


final class SeatInfoTVC : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    static let identifier = "seatInfoTVC"
    private var seatValue : Int = 0
    private lazy var seatsCollectionView : UICollectionView  = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let  collectionview = UICollectionView(frame: .zero,
                                         collectionViewLayout: layout)
        collectionview.register(
            SeatCVC.self,
            forCellWithReuseIdentifier: SeatCVC.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = Theme.theme.themeColor.primaryBackground
        return collectionview
    }()
    
    private lazy var sequenceLabel : UILabel = {
        let label = UILabel()
         label.textColor = Theme.theme.themeColor.primaryLabel
         label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
         label.textAlignment = .center
         return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Theme.theme.themeColor.primaryBackground
       
        seatsCollectionView.delegate = self
        seatsCollectionView.dataSource = self
        seatsCollectionView.reloadData()

        addSubview(sequenceLabel)
        sequenceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        
        
        
        addSubview(seatsCollectionView)
        seatsCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(sequenceLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    func configureData(squenceData:Int,seatCount:Int) {
        seatValue = seatCount
        sequenceLabel.text = "\(squenceData + 1)(\(seatCount))"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SeatInfoTVC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seatValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SeatCVC.identifier,
            for: indexPath) as? SeatCVC else {return UICollectionViewCell()}
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           // Hücre boyutunu belirleyin
           return CGSize(width: 50, height: 50) // Örneğin, genişlik ve yükseklik 100 olarak belirlendi
       }
}
