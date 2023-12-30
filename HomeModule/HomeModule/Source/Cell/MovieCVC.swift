import UIKit
import SnapKit
import ThemeKit

final class MovieCVC: UICollectionViewCell {
    static let identifier : String = "cell"
    
    private lazy var movieImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Radius.medium.rawValue
        return imageView
    }()
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        return label
    }()
    
    private lazy var movieCategory : UILabel = {
       let label = UILabel()
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.font = Theme.theme.themeFont.cellSubLabelFont
        return label
    }()
    
    func configureData(
        image:UIImage,
        movieName:String,
        category:String){
            
        movieImageView.image = image
        movieNameLabel.text = movieName
        movieCategory.text = category
    }
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        contentView.addSubview(movieCategory)
        movieCategory.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        
        contentView.addSubview(movieNameLabel)
        movieNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(movieCategory.snp.top).offset(-5)
            make.leading.equalToSuperview().offset(20)
        }
        
        contentView.addSubview(movieImageView)
        movieImageView.snp.makeConstraints { make in
             make.top.equalToSuperview()
            make.bottom.equalTo(movieNameLabel.snp.top).offset(-5)
            make.leading.equalToSuperview().offset(20)
             make.trailing.equalToSuperview()
         }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
