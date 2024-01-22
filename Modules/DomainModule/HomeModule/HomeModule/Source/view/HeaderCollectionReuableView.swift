import UIKit
import SnapKit
import ThemeKit

final class HeaderCollectionReuableView : UICollectionReusableView {
    static let identifier  = "headerCollectionReuableViewCell"
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureData(title:String){
        titleLabel.text = title
    }
}
