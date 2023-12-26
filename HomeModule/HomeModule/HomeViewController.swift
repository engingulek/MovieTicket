
import UIKit
import SnapKit
class HomeViewController: UIViewController {
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Hi,Engin"
        label.textColor = UIColor(resource: .primaryLabel)
        label.font = .systemFont(ofSize: 30,weight: .semibold)
        return label
    }()
    
    private lazy var userImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .user)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50/2
        return imageView
    }()
    
    private lazy var searhTextField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "Search Movie"
        textField.backgroundColor = UIColor(resource: .secondatyBack)
        textField.textColor = UIColor(resource: .primaryLabel)
        return textField
    }()
    
    private lazy var searchIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = UIColor(resource: .primaryLabel)
        return image
    }()
    
    private lazy var searchView : UIView = {
        let uiview = UIView()
        uiview.layer.cornerRadius = 10
        uiview.backgroundColor = UIColor(resource: .secondatyBack)
        return uiview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .background)
        configureUI()
    }
    
    private func configureUI(){
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        view.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }
        
        searchView.addSubview(searchIcon)
        searchIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        searchView.addSubview(searhTextField)
        searhTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(searchIcon.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            
        }
    }
}



