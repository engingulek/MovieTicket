
import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ThemeKit

protocol HallınfoTVCDelegate {
    func selectedBaseLanguage()
    func selectedSubLangue()
}


final class HallInfoTVC : UITableViewCell {
    static let identifier = "hallInfoTVC"
    var delegate : HallınfoTVCDelegate?
    private lazy var locIcon : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.and.ellipse")
        imageView.tintColor = Theme.theme.themeColor.primaryLabel
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var cinemaNameLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
    
    private lazy var hallNumberLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
    
    private lazy var movieLanguageLabelBase : UIButton = {
        let button = UIButton()
        button.backgroundColor = Theme.theme.themeColor.thirdBack
        button.titleLabel?.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        button.setTitleColor(Theme.theme.themeColor.primaryLabel, for: .normal)
        button.layer.cornerRadius = Radius.small.rawValue
        button.addAction(movieLanguageLabelBaseTapped, for: .touchUpInside)
        return button
    }()
    
    private lazy var movieLanguageLabelBaseTapped : UIAction = UIAction { _ in
        self.delegate?.selectedBaseLanguage()
    }
    
    private lazy var movieLanguageLabelSubtitle : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        button.backgroundColor = Theme.theme.themeColor.thirdBack
        button.setTitleColor(Theme.theme.themeColor.primaryLabel, for: .normal)
        button.layer.cornerRadius = Radius.small.rawValue
        button.addAction(movieLanguageLabelSubtitleTapped, for: .touchUpInside)
        return button
    }()
    
    private lazy var movieLanguageLabelSubtitleTapped : UIAction = UIAction { _ in
        self.delegate?.selectedSubLangue()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Theme.theme.themeColor.primaryBackground
       
        
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
        
        contentView.addSubview(movieLanguageLabelBase)
        movieLanguageLabelBase.snp.makeConstraints { make in
            make.top.equalTo(cinemaNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(40)
            make.width.equalTo(UIScreen.main.bounds.width / 4)
        }
        
      
        
        contentView.addSubview(movieLanguageLabelSubtitle)
        movieLanguageLabelSubtitle.snp.makeConstraints { make in
            make.top.equalTo(cinemaNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(movieLanguageLabelBase.snp.trailing).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(UIScreen.main.bounds.width / 3)
        }
       
    }
    
    func configureData(cinemaName:String,
                hallNumber:String,
                movieLanguageBase:String,
                movieLanguageSubtitle:String
    ){
        cinemaNameLabel.text = cinemaName
        hallNumberLabel.text = hallNumber
        movieLanguageLabelBase.setTitle(movieLanguageBase, for: .normal) 
        movieLanguageLabelSubtitle.setTitle(movieLanguageSubtitle, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




