import Foundation
import UIKit
import SnapKit
import ThemeKit
import CommenUIKit

protocol CardInfoViewDelegate {
    func buyTicketButtonTapped()
}

final class CardInfoView : UIView {
    var delegate : CardInfoViewDelegate?
    private lazy var nameOnTheCardabel : UILabel = {
        let label = UILabel()
        label.text = "Name On The Card"
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = UIColor(hex: Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    
    private lazy var nameOnTheCardTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name on the card"
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.textFieldBackColor)?.withAlphaComponent(0.5)
        textField.textColor = UIColor(hex: Theme.theme.themeColor.thirdLabel)
        textField.keyboardType = .default
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        return textField
    }()
    
    
    private lazy var cardNumberLabel : UILabel = {
        let label = UILabel()
        label.text = "Card Number"
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = UIColor(hex: Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    private lazy var cardNumberTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = MaskFormat.cardNumber.rawValue
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.textFieldBackColor)?.withAlphaComponent(0.5)
        textField.textColor = UIColor(hex: Theme.theme.themeColor.thirdLabel)
        textField.keyboardType = .numberPad
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var expirationDateLabel : UILabel = {
        let label = UILabel()
        label.text = "Expiration Date"
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = UIColor(hex: Theme.theme.themeColor.thirdLabel)
        return label
    }()
    
    private lazy var expirationDateTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "MM/YY"
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.textFieldBackColor)?.withAlphaComponent(0.5)
        textField.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        textField.keyboardType = .numberPad
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var securityCodeLabel : UILabel = {
        let label = UILabel()
        label.text = "Security Code"
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var securityCodeTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "***"
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.textFieldBackColor)?.withAlphaComponent(0.5)
        textField.textColor = UIColor(hex:Theme.theme.themeColor.thirdLabel)
        textField.keyboardType = .numberPad
        textField.layer.cornerRadius = Radius.small.rawValue
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var buyTicletButton : UIButton = {
        let button = UIButton()
        button.setTitle("Buy Ticket", for: .normal)
        button.setTitleColor(UIColor(hex:Theme.theme.themeColor.primaryLabel), for: .normal)
        button.titleLabel?.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        button.backgroundColor = UIColor(hex:Theme.theme.themeColor.thirdBack)
        button.titleLabel?.textAlignment = .left
        button.layer.cornerRadius = Radius.small.rawValue
        button.addAction(buyTicketButtonTapped, for: .touchUpInside)
        return  button
    }()
    
    private lazy var buyTicketButtonTapped : UIAction = UIAction { _ in
        self.delegate?.buyTicketButtonTapped()
    }

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = Radius.small.rawValue
        cardNumberTextField.delegate = self
        expirationDateTextField.delegate = self
        securityCodeTextField.delegate = self
        addSubview(nameOnTheCardabel)
        nameOnTheCardabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(nameOnTheCardTextField)
        nameOnTheCardTextField.snp.makeConstraints { make in
            make.top.equalTo(nameOnTheCardabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(40)
        }
        
        addSubview(cardNumberLabel)
        cardNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameOnTheCardTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(cardNumberTextField)
        cardNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(cardNumberLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(40)
        }
        
        addSubview(expirationDateLabel)
        expirationDateLabel.snp.makeConstraints { make in
            make.top.equalTo(cardNumberTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(expirationDateTextField)
        expirationDateTextField.snp.makeConstraints { make in
            make.top.equalTo(expirationDateLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(UIScreen.main.bounds.width / 2.5)
            make.height.equalTo(40)
           
        }
        
        addSubview(securityCodeLabel)
        securityCodeLabel.snp.makeConstraints { make in
            make.top.equalTo(cardNumberTextField.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width / 2.5)
            
        }
        addSubview(securityCodeTextField)
        securityCodeTextField.snp.makeConstraints { make in
            make.top.equalTo(securityCodeLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(UIScreen.main.bounds.width / 2.5)
            make.height.equalTo(40)
        }
        
        addSubview(buyTicletButton)
        buyTicletButton.snp.makeConstraints { make in
            make.top.equalTo(securityCodeTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width / 1.5)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardInfoView : UITextFieldDelegate {
    func textField(_ textField: UITextField,
                shouldChangeCharactersIn range: NSRange,
                replacementString string: String) -> Bool {
        if textField == cardNumberTextField {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            cardNumberTextField.text = newString.format(mask: .cardNumber)
        }else if textField == expirationDateTextField {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            expirationDateTextField.text = newString.format(mask: .expirationDate)
        }else if textField == securityCodeTextField {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            securityCodeTextField.text = newString.format(mask: .securatiyCode)
        }else{
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = newString.format(mask: .defaultCode)
        }
       
        return false
    }
}
