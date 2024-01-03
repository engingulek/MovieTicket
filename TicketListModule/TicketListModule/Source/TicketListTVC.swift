
import Foundation
import UIKit
import SnapKit
import ThemeKit


class TicketListTVC : UITableViewCell {
    static let identifier : String = "ticketListTVC"
    
    private lazy var movieImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(resource: .dune)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Radius.small.rawValue
        return imageView
    }()
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Dune : Part Two"
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
    private lazy var languageInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "English(Subtitle)"
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textColor =  Theme.theme.themeColor.primaryLabel
        return label
    }()
    
    
    private lazy var cinemaNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Life Cinema"
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
    private lazy var hallNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "Hall 2"
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
    
    private lazy var dateInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "01/04/2024 17:40"
        label.font = Theme.theme.themeFont.cellLabelFont
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
    
    private lazy var ticketAmount : UILabel = {
        let label = UILabel()
        label.text = "2 Person x $40"
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
    
   
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Theme.theme.themeColor.primaryBackground
        
        contentView.addSubview(movieImageView)
        movieImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(UIScreen.main.bounds.height / 6)
            make.width.equalTo(UIScreen.main.bounds.width / 4)
        }
        
        contentView.addSubview(movieNameLabel)
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.top)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
        }
        
        contentView.addSubview(languageInfoLabel)
        languageInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
        }
        
        contentView.addSubview(cinemaNameLabel)
        cinemaNameLabel.snp.makeConstraints { make in
            make.top.equalTo(languageInfoLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
        }
        
        contentView.addSubview(hallNumberLabel)
        hallNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(cinemaNameLabel.snp.top)
            make.leading.equalTo(cinemaNameLabel.snp.trailing).offset(10)
        }
        
        contentView.addSubview(dateInfoLabel)
        dateInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(hallNumberLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
        }
        
        
        contentView.addSubview(ticketAmount)
        ticketAmount.snp.makeConstraints { make in
            make.top.equalTo(dateInfoLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
