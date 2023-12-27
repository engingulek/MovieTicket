
import UIKit
import SnapKit

final class MovieCVC: UICollectionViewCell {
    static let identifier : String = "cell"
    private lazy var movieImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25,weight:.bold)
        return label
    }()
    
    private lazy var movieCategory : UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15,weight:.medium)
        return label
    }()
    
    func configureData(image:UIImage,movieName:String,category:String){
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
