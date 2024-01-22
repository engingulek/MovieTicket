
import Foundation
import UIKit
import SnapKit
import ThemeKit
import ModelKit


class SearchMovieTVC : UITableViewCell {
    static let identifier : String = "searchMovieTVC"
    
    private lazy var movieImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Radius.small.rawValue
        return imageView
    }()
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        return label
    }()
    
   
    
    private lazy var genresLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        return label
    }()
    
    
    private lazy var detailLabelLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.numberOfLines = .zero
        return label
    }()
   
    func configureData(movieResult :MovieResult) {
        let url = URL(string: movieResult.imageURL)
        movieImageView.kf.setImage(with: url)
        movieNameLabel.text = movieResult.name
        genresLabel.text = movieResult.genres.joined(separator: ", ")
        detailLabelLabel.text = movieResult.movieInfo
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        
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
        
        
        contentView.addSubview(genresLabel)
        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
        }
        
        contentView.addSubview(detailLabelLabel)
        detailLabelLabel.snp.makeConstraints { make in
            make.top.equalTo(genresLabel.snp.bottom).offset(5)
            make.leading.equalTo(movieImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
            make.height.equalTo(UIScreen.main.bounds.height / 10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
