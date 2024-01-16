import Foundation
import UIKit
import SnapKit
import ThemeKit


final class ContactinfoView : UIView{
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Contanct Info"
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        label.font = Theme.theme.themeFont.primaryFont.boldVersion
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Your ticket will be prepare according to the following information"
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        label.font = Theme.theme.themeFont.cellSubLabelFont
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var nameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.textFieldBackColor)?.withAlphaComponent(0.5)
        textField.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        textField.keyboardType = .default
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        textField.tag = 0
        return textField
    }()
    
    private lazy var subnameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.textFieldBackColor)?.withAlphaComponent(0.5)
        textField.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        textField.keyboardType = .default
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        textField.tag = 1
        return textField
    }()
    
    
    private lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.textFieldBackColor)?.withAlphaComponent(0.5)
        textField.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.tag = 2
        return textField
    }()
    
    private lazy var phoneNumberTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = MaskFormat.phoneNumber.rawValue
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.textFieldBackColor)?.withAlphaComponent(0.5)
        textField.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        textField.keyboardType = .numberPad
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        textField.tag = 3
        return textField
    }()
    
    
    func configureUIForAlert(color:String,tag:Int){
        if tag == 0 {
            nameTextField.layer.borderColor = UIColor(hex:color)?.cgColor
            nameTextField.layer.borderWidth = 1
        }
        
        if tag == 1 {
            subnameTextField.layer.borderColor = UIColor(hex:color)?.cgColor
        subnameTextField.layer.borderWidth = 1
        }
        
        if tag == 2 {
            emailTextField.layer.borderColor = UIColor(hex:color)?.cgColor
            emailTextField.layer.borderWidth = 1
        }
        
        if tag == 3 {
            phoneNumberTextField.layer.borderColor = UIColor(hex:color)?.cgColor
            phoneNumberTextField.layer.borderWidth = 1
        }
        print("Contact Info View Alert \(color) \(tag)")
    }
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = Radius.small.rawValue
        phoneNumberTextField.delegate = self
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
    
    func returnContactInfo() -> ContanctInfo {
        let contactInfo = ContanctInfo(
            name: nameTextField.text ?? "",
            surname: subnameTextField.text ?? "",
            email: emailTextField.text ?? "",
            phoneNumber: phoneNumberTextField.text ?? "")
        return contactInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactinfoView : UITextFieldDelegate {
    func textField(_ textField: UITextField, 
                shouldChangeCharactersIn range: NSRange,
                replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        phoneNumberTextField.text = newString.format(mask: .phoneNumber)
        return false
    }
}
