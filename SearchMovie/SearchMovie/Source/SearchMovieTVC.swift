
import Foundation
import UIKit
import SnapKit
import ThemeKit


class SearchMovieTVC : UITableViewCell {
    static let identifier : String = "searchMovieTVC"
    
    private lazy var movieImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image =  UIImage(resource: .dune)
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
    
    private lazy var languageLabel : UILabel = {
        let label = UILabel()
        label.text = "EnglishSubtitle"
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
 
    
    private lazy var genresLabel : UILabel = {
        let label = UILabel()
        label.text = "Dram,Action"
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textColor = Theme.theme.themeColor.primaryLabel
        return label
    }()
    
    
    private lazy var detailLabelLabel : UILabel = {
        let label = UILabel()
        label.text = "In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design."
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.numberOfLines = .zero
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
        
        contentView.addSubview(languageLabel)
        languageLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
        }
        
        contentView.addSubview(genresLabel)
        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(languageLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
        }
        
        contentView.addSubview(detailLabelLabel)
        detailLabelLabel.snp.makeConstraints { make in
            make.top.equalTo(genresLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
