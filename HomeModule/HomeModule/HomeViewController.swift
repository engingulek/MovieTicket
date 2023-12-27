
import UIKit
import SnapKit
class HomeViewController: UIViewController {
    let cellTypes : [String] = ["movieInCinemaCell","futureMovieCell"]
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
    
    
    
    private lazy var movieListCollectionView : UICollectionView  = {
     let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
     layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
     
     layout.scrollDirection = .vertical
     let  collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
     collectionview.showsHorizontalScrollIndicator = false
     collectionview.backgroundColor = UIColor(resource: .background)
     return collectionview
     }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .background)
        movieListCollectionView.delegate = self
        movieListCollectionView.dataSource = self
        movieListCollectionView.register(MovieListCVCForFuture.self, forCellWithReuseIdentifier: MovieListCVCForFuture.idetifier)
        movieListCollectionView.register(MovieListCVCForInCineme.self, forCellWithReuseIdentifier: MovieListCVCForInCineme.idetifier)

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
        
        view.addSubview(movieListCollectionView)
        movieListCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, 
                    numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = cellTypes[indexPath.section]
        
        if cellType == "movieInCinemaCell" {
            guard let cell = movieListCollectionView.dequeueReusableCell(
                withReuseIdentifier: MovieListCVCForInCineme.idetifier,
                for: indexPath) as? MovieListCVCForInCineme else {return UICollectionViewCell()}
            return cell
        }else{
            guard let cell = movieListCollectionView.dequeueReusableCell(
                withReuseIdentifier: MovieListCVCForFuture.idetifier,
                for: indexPath) as? MovieListCVCForFuture else {return UICollectionViewCell()}
            return cell
        }

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}


extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellType = cellTypes[indexPath.section]
        if cellType == "movieInCinemaCell" {
            return CGSize(width: UIScreen.main.bounds.width, 
                       height: UIScreen.main.bounds.height / 2)
        }else{
            return CGSize(width: UIScreen.main.bounds.width, 
                    height: UIScreen.main.bounds.height / 3)
        }
    }
}










