
import UIKit
import SnapKit
import ThemeKit
public final class PartnerCVC: UICollectionViewCell {
   public static let identifier : String = "cell"
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Radius.medium.rawValue
        return imageView
    }()
    
    private lazy var firstLabel : UILabel = {
        let label = UILabel()
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var secondryLabel : UILabel = {
       let label = UILabel()
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.font = Theme.theme.themeFont.cellSubLabelFont
        return label
    }()
    
   public func configureData(image:UIImage,firstText:String,secondaryText:String){
        imageView.image = image
        firstLabel.text = firstText
        secondryLabel.text = secondaryText
    }
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        contentView.addSubview(secondryLabel)
        secondryLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        
        contentView.addSubview(firstLabel)
        firstLabel.snp.makeConstraints { make in
            make.bottom.equalTo(secondryLabel.snp.top).offset(-5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
             make.top.equalToSuperview()
            make.bottom.equalTo(firstLabel.snp.top).offset(-5)
            make.leading.equalToSuperview().offset(20)
             make.trailing.equalToSuperview()
         }
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
