
import UIKit
import SnapKit
import ThemeKit
public final class OnlyLabelCVC : UICollectionViewCell {
   public  static let identifier : String = "onlyLabelCVC"
    
    private lazy var textLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = Radius.small.rawValue
        return label
    }()
    
 
   public func configureData(labelText:String){
        textLabel.text = labelText
    }
    
    public func configureIU(backColor:String,labelColor:String,font:UIFont){
        textLabel.backgroundColor = UIColor(hex:backColor)
        textLabel.textColor = UIColor(hex:labelColor)
        textLabel.font = font
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
