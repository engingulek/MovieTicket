import Foundation
import UIKit
import SnapKit
import ThemeKit
import CommenUIKit

class SearchMovieView : UIView {
    
    private lazy var searhTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = Theme.theme.themeText.defaultSearchText
        textField.backgroundColor = UIColor(hex:Theme.theme.themeColor.secondaryBack)
        textField.textColor = UIColor(hex:Theme.theme.themeColor.secondaryLabel)
        return textField
    }()
    
    private lazy var searchIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: Theme.theme.themeSystemImageName.searchIcon)
        image.tintColor = UIColor(hex:Theme.theme.themeColor.secondaryLabel)
        return image
    }()
    
    private lazy var searchView : UIView = {
        let uiview = UIView()
        uiview.layer.cornerRadius = Radius.small.rawValue
        uiview.backgroundColor = UIColor(hex:Theme.theme.themeColor.secondaryBack)
        return uiview
    }()
    
    private lazy var searchMovieTableViewActivityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(hex:Theme.theme.themeColor.activityIndicatorColor)
        indicator.style = .large
        return indicator
    }()
    
    private lazy var searchMovieTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(SearchMovieTVC.self,
                           forCellReuseIdentifier: SearchMovieTVC.identifier)
        tableView.allowsMultipleSelection = true
        tableView.backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    func configureView(searhtext:String){
        searhTextField.text = searhtext
    }
    
    
    func prepareTableView(view : SearchMovieViewController){
        searchMovieTableView.delegate = view
        searchMovieTableView.dataSource = view
    }
    
    func reloadTableView(){
        searchMovieTableView.reloadData()
    }
    
    func prepareTextField(view:SearchMovieViewController) {
        searhTextField.delegate = view
    }
    
    func startAnimatigIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            searchMovieTableViewActivityIndicator.startAnimating()
        }
    }
    
    func stopAnimatingIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            searchMovieTableViewActivityIndicator.stopAnimating()
        }
    }
    
    private func configureUI(){
        addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
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
        
        addSubview(searchMovieTableView)
        searchMovieTableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        searchMovieTableView.addSubview(searchMovieTableViewActivityIndicator)
        searchMovieTableViewActivityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
