import Foundation
import UIKit
import ThemeKit

final class SeatCVC : UICollectionViewCell {
    static let identifier : String = "cell"
    
    private lazy var seatLabel : UILabel = {
       let label = UILabel()
        label.backgroundColor = Theme.theme.themeColor.primaryLabel
        label.layer.cornerRadius = Radius.small.rawValue
        label.text = "A1"
        label.layer.masksToBounds = true
        label.textColor = Theme.theme.themeColor.thirdBack
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(seatLabel)
        seatLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
