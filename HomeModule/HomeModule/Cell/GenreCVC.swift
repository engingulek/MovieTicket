
import UIKit
import SnapKit

final class GenreCVC : UICollectionViewCell {
    static let identifier : String = "genreCell"
    
    private lazy var genreNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25,weight:.semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(resource: .secondatyBack)
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
 
    func configureData(genreName:String){
        genreNameLabel.text = genreName
    }
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(genreNameLabel)
        genreNameLabel.snp.makeConstraints { make in
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
