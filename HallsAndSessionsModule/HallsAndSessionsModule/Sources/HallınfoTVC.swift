
import Foundation
import UIKit
import SnapKit
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor =  UIColor(resource: .background)
        
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
        
        configureUI()
    }
    
    
    func configureData(cinemaName:String,
                hallNumber:String,
                movieLanguage:String){
        cinemaNameLabel.text = cinemaName
        hallNumberLabel.text = hallNumber
        movieLanguageLabel.text = movieLanguage
        
    }
    
    
    private func configureUI(){
        
        
        /*contentView.addSubview(cinemaNameLabel)
        cinemaNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(locIcon.snp.trailing)
        }*/
        
      /*
        }
        
       /* contentView.addSubview(locIcon)
        locIcon.snp.makeConstraints { make in
            make.top.equalTo(cinemaNameLabel.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }*/
        
       
        
        contentView.addSubview(hallNumberLabel)
        hallNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(cinemaNameLabel.snp.top)
            make.trailing.equalToSuperview().offset(20)
        }
        
        contentView.addSubview(movieLanguageLabel)
        movieLanguageLabel.snp.makeConstraints { make in
            make.top.equalTo(hallNumberLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(20)
        }*/
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
