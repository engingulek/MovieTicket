import Foundation
import UIKit
import SnapKit
import ThemeKit
final class ContactinfoView : UIView{
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Contanct Info"
        label.textColor = Theme.theme.themeColor.thirdLabel
        label.font = Theme.theme.themeFont.primaryFont.boldVersion
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Your ticket will be prepare according to the following information"
        label.textColor = Theme.theme.themeColor.thirdLabel
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var nameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.backgroundColor = Theme.theme.themeColor.textFieldBackColor
        textField.textColor = Theme.theme.themeColor.thirdLabel
        textField.keyboardType = .default
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var subnameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.backgroundColor = Theme.theme.themeColor.textFieldBackColor
        textField.textColor = Theme.theme.themeColor.thirdLabel
        textField.keyboardType = .default
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        return textField
    }()
    
    
    private lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.backgroundColor = Theme.theme.themeColor.textFieldBackColor
        textField.textColor = Theme.theme.themeColor.thirdLabel
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var phoneNumberTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "(***) *** ** **"
        textField.backgroundColor = Theme.theme.themeColor.textFieldBackColor
        textField.textColor = Theme.theme.themeColor.thirdLabel
        textField.keyboardType = .numberPad
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = Radius.small.rawValue
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
          
        }
        
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(40)
        }
        
        addSubview(subnameTextField)
        subnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(40)
        }
        
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(subnameTextField.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(40)
        }
        
        addSubview(phoneNumberTextField)
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(40)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
