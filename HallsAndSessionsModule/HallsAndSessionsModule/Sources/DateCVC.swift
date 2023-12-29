

import UIKit

class DateCVC : UICollectionViewCell {
    static let identifier : String = "dateCVC"
    private lazy var timeLabel : UILabel = {
        let label = UILabel()
        label.text = "Dec/29/2024"
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor(resource: .secondaryBack)
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
