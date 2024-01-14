import UIKit
import SnapKit
import ThemeKit


final class MovieAndTicketInfoView : UIView {
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Dune : Part Two"
        label.font = Theme.theme.themeFont.primaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    private lazy var languageInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "English(Subtitle)"
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    
    private lazy var cinemaNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Life Cinema"
        label.font = Theme.theme.themeFont.cellLabelFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    
    private lazy var hallNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "Hall 2"
        label.font = Theme.theme.themeFont.cellLabelFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    private lazy var horizatalLine : UIView = {
       let uiView = UIView()
        uiView.backgroundColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
       return uiView
    }()
    
    
    private lazy var dateInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "01/04/2024 17:40"
        label.font = Theme.theme.themeFont.cellLabelFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    private lazy var ticketAmount : UILabel = {
        let label = UILabel()
        label.text = "Ticket Amount : 40$"
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = Radius.small.rawValue
        addSubview(movieNameLabel)
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(languageInfoLabel)
        languageInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(cinemaNameLabel)
        cinemaNameLabel.snp.makeConstraints { make in
            make.top.equalTo(languageInfoLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(hallNumberLabel)
        hallNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(cinemaNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(dateInfoLabel)
        dateInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(hallNumberLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        
        addSubview(horizatalLine)
        horizatalLine.snp.makeConstraints { make in
            make.top.equalTo(dateInfoLabel.snp.bottom).offset(20)
            make.height.equalTo(2)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        addSubview(ticketAmount)
        ticketAmount.snp.makeConstraints { make in
            make.top.equalTo(horizatalLine.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
