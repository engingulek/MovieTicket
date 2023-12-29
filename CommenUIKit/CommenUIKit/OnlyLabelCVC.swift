
import UIKit
import SnapKit

public final class OnlyLabelCVC : UICollectionViewCell {
   public  static let identifier : String = "genreCell"
    
    private lazy var textLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
 
   public func configureData(labelText:String){
        textLabel.text = labelText
    }
    
    public func configureIU(backColor:UIColor,ofSize:Double){
        textLabel.backgroundColor = backColor
        textLabel.font = .systemFont(ofSize: ofSize,weight:.semibold)
    }
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
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
