import Foundation
import UIKit
import Kingfisher
import SnapKit
import ThemeKit
import CommenUIKit

final class TicketView : UIView {
    
    private lazy var movieImage : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var dateInfoLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.secondaryFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    
    
    private lazy var hallNumberTitleLabel : UILabel = {
        let label = UILabel()
        label.text = Theme.theme.themeText.hall
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hallNumberLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.secondaryFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    
    
    
    private lazy var seatsNumberTitleLabel : UILabel = {
        let label = UILabel()
        label.text = Theme.theme.themeText.seats
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var seatsNumberLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.secondaryFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var line = DottedLineView()
    
    private lazy var barcode : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    func configureData(ticket:Ticket) {
        let url = URL(string: ticket.movieURL)
        movieImage.kf.setImage(with: url)
        movieNameLabel.text = ticket.movieName
        let date = ticket.date.convertStringToDate(format: "MM/yy")
        let dateString = date?.convertDateToString(format: "MM/yy")
        let hour = ticket.hour
        dateInfoLabel.text = "\(dateString ?? "") \(hour)"
        hallNumberLabel.text = "\(ticket.hall)"
        let seats = ticket.seats.map {
            "(\($0.row),\($0.col)) "
        }
        seatsNumberLabel.text = "\(seats.joined(separator: ","))"
        
        if let barcodeImage = BarcodeGenerator.generateBarcode(
            from: "\(ticket.barcode)") {
            barcode = UIImageView(image: barcodeImage)
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(hex:Theme.theme.themeColor.secondaryBack)
        layer.cornerRadius = Radius.medium.rawValue
        
        addSubview(movieImage)
        movieImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 2.5)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        addSubview(movieNameLabel)
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        addSubview(dateInfoLabel)
        dateInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        addSubview(hallNumberTitleLabel)
        hallNumberTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateInfoLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(hallNumberLabel)
        hallNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(hallNumberTitleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        addSubview(seatsNumberTitleLabel)
        seatsNumberTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(hallNumberLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(seatsNumberLabel)
        seatsNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(seatsNumberTitleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        addSubview(line)
        line.snp.makeConstraints { make in
            make.top.equalTo( seatsNumberLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(5)
        }
        
        addSubview(barcode)
        barcode.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(UIScreen.main.bounds.height / 3.5)
            
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




