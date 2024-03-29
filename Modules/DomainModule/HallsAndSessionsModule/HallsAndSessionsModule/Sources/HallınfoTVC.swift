
import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ThemeKit

protocol HallınfoTVCDelegate {
    func selectedBaseLanguage(row:Int,baseLanguageId:Int)
    func selectedSubLangue(row:Int,subLanguageId:Int)
}


final class HallInfoTVC : UITableViewCell {
    static let identifier = "hallInfoTVC"
    var delegate : HallınfoTVCDelegate?
    var indexPath : IndexPath = [0,0]
    private var baseLanguageId:Int = 0
    private var subLanguageId:Int = 0
    
    private lazy var locIcon : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: Theme.theme.themeSystemImageName.mapIn)
        imageView.tintColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var cinemaNameLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        return label
    }()
    
    private lazy var hallNumberLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        return label
    }()
    
    private lazy var movieLanguageLabelBase : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex:Theme.theme.themeColor.thirdBack)
        button.titleLabel?.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        button.setTitleColor(UIColor(hex:Theme.theme.themeColor.primaryLabel), for: .normal)
        button.layer.cornerRadius = Radius.small.rawValue
        button.addAction(movieLanguageLabelBaseTapped, for: .touchUpInside)
        return button
    }()
    
    private lazy var movieLanguageLabelBaseTapped : UIAction = UIAction { _ in
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            let row =  indexPath.row
            self.delegate?.selectedBaseLanguage(row: row, baseLanguageId: baseLanguageId)
        }
    }
    
    private lazy var movieLanguageLabelSubtitle : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        button.backgroundColor = UIColor(hex:Theme.theme.themeColor.thirdBack)
        button.setTitleColor(UIColor(hex:Theme.theme.themeColor.primaryLabel), for: .normal)
        button.layer.cornerRadius = Radius.small.rawValue
        button.addAction(movieLanguageLabelSubtitleTapped, for: .touchUpInside)
        return button
    }()
    
    private lazy var movieLanguageLabelSubtitleTapped : UIAction = UIAction { _ in
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            let row =  indexPath.row
            self.delegate?.selectedSubLangue(row: row,subLanguageId:subLanguageId)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        configureUI()
    }
    
    private func configureUI(){
        
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
             make.width.equalTo(UIScreen.main.bounds.width / 3)
         }
         
         contentView.addSubview(movieLanguageLabelSubtitle)
         movieLanguageLabelSubtitle.snp.makeConstraints { make in
             make.top.equalTo(cinemaNameLabel.snp.bottom).offset(10)
             make.leading.equalTo(movieLanguageLabelBase.snp.trailing).offset(20)
             make.height.equalTo(40)
             make.width.equalTo(UIScreen.main.bounds.width / 3)
         }
    }
    
    func configureData(hallAndSession : HallAndSession){
        cinemaNameLabel.text = hallAndSession.cinameName
        hallNumberLabel.text = "\(Theme.theme.themeText.hall.lowercased()) \(hallAndSession.hallNumber)"
        let language = hallAndSession.language
        
        if language.count == 2 {
            movieLanguageLabelBase.setTitle(language[0].type, for: .normal)
            baseLanguageId = language[0].id
            movieLanguageLabelSubtitle.setTitle(language[1].type, for: .normal)
            subLanguageId = language[1].id
            movieLanguageLabelSubtitle.isHidden = false
            movieLanguageLabelSubtitle.isEnabled = true
        }else{
            movieLanguageLabelBase.setTitle(language[0].type, for: .normal)
            baseLanguageId = language[0].id
            movieLanguageLabelSubtitle.isHidden = true
            movieLanguageLabelSubtitle.isEnabled = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
