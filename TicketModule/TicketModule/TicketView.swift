import Foundation
import UIKit
import SnapKit
import ThemeKit
import CommenUIKit

final class TicketView : UIView {
    
    private lazy var movieImage : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(resource: .dune)
        return imageView
    }()
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Dune : Part Two"
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var dateInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "Jan 06, 04:15 p.m"
        label.font = Theme.theme.themeFont.secondaryFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
   
    
    private lazy var hallNumberTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Hall"
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hallNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = Theme.theme.themeFont.secondaryFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var rowNumberTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Row"
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var rowNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = Theme.theme.themeFont.secondaryFont
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    
    
    private lazy var seatsNumberTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Seats"
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var seatsNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "2,3"
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
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if let barcodeImage = BarcodeGenerator.generateBarcode(
            from: "123456789") {
            barcode = UIImageView(image: barcodeImage)
        }
        
        
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
        
        
        addSubview(rowNumberTitleLabel)
        rowNumberTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateInfoLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        addSubview(rowNumberLabel)
        rowNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(rowNumberTitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(rowNumberTitleLabel.snp.leading)
            make.trailing.equalTo(rowNumberTitleLabel.snp.trailing)
        }
        
        addSubview(hallNumberTitleLabel)
        hallNumberTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(rowNumberTitleLabel.snp.top)
            make.trailing.equalTo(rowNumberTitleLabel.snp.leading).offset(-25)
        }
        
        addSubview(hallNumberLabel)
        hallNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(hallNumberTitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(hallNumberTitleLabel.snp.leading)
            make.trailing.equalTo(hallNumberTitleLabel.snp.trailing)
        }
        
        addSubview(seatsNumberTitleLabel)
        seatsNumberTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(rowNumberTitleLabel.snp.top)
            make.leading.equalTo(rowNumberTitleLabel.snp.trailing).offset(25)
        }
        
        addSubview(seatsNumberLabel)
        seatsNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(seatsNumberTitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(seatsNumberTitleLabel.snp.leading)
            make.trailing.equalTo(seatsNumberTitleLabel.snp.trailing)
        }
        
        addSubview(line)
        line.snp.makeConstraints { make in
            make.top.equalTo(rowNumberLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(5)
        }
        
        addSubview(barcode)
        barcode.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




