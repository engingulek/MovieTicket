import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ThemeKit

final class ChooseSeatView : UIView {
    
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.primaryFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.text = "Dune: Part Two"
       return label
    }()
    
    
    private lazy var moviedateLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.text = "04/01/2014"
       return label
    }()
    
    
    private lazy var movieLanguageLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.text = "English(Subtitle)"
       return label
    }()
    
    
    private lazy var seatListTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(SeatInfoTVC.self, forCellReuseIdentifier: SeatInfoTVC.identifier)
        tableView.allowsMultipleSelection = true
        tableView.backgroundColor = Theme.theme.themeColor.primaryBackground
        tableView.separatorColor = Theme.theme.themeColor.primaryBackground
        return tableView
    }()
    
    private lazy var hourcollectionview : UICollectionView  = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 5,
                                 height:UIScreen.main.bounds.height / 15 )
        layout.scrollDirection = .horizontal
        let  collectionview = UICollectionView(frame: .zero,
                                         collectionViewLayout: layout)
        collectionview.register(
            OnlyLabelCVC.self,
            forCellWithReuseIdentifier: OnlyLabelCVC.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = Theme.theme.themeColor.primaryBackground
        return collectionview
    }()
    
    
  
    
    private lazy var screneLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.text = "Scene"
        label.textAlignment = .center
       return label
    }()
    
    
    private lazy var seatFullUIView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = Radius.small.rawValue
        return view
        
    }()
    
    private lazy var seatFullLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.text = "Full"
        label.textAlignment = .center
       return label
    }()
    
    
    
    private lazy var seatChosenUIView : UIView = {
        let view = UIView()
        view.backgroundColor = Theme.theme.themeColor.thirdBack
        view.layer.cornerRadius = Radius.small.rawValue
        return view
        
    }()
    
    private lazy var seatChoseLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.text = "Chosen"
        label.textAlignment = .center
       return label
    }()
    
    
    private lazy var seatEmptyUIView : UIView = {
        let view = UIView()
        view.backgroundColor = Theme.theme.themeColor.primaryLabel
        view.layer.cornerRadius = Radius.small.rawValue
        return view
        
    }()
    
    private lazy var seatEmptyLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = Theme.theme.themeColor.primaryLabel
        label.text = "Empty"
        label.textAlignment = .center
       return label
    }()
    
    func prepareTableView(view:ChooseSeatViewController){
        seatListTableView.delegate = view
        seatListTableView.dataSource = view
    }
    
    func reloadDataTableView(){
        seatListTableView.reloadData()
    }
    
    
    func prepareCollectionView(view:ChooseSeatViewController){
        hourcollectionview.delegate = view
        hourcollectionview.dataSource = view
    }
    
    func reloadDataCollectionView(){
        hourcollectionview.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(movieNameLabel)
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(moviedateLabel)
        moviedateLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        
        addSubview(movieLanguageLabel)
        movieLanguageLabel.snp.makeConstraints { make in
            make.top.equalTo(moviedateLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        addSubview(hourcollectionview)
        hourcollectionview.snp.makeConstraints { make in
            make.top.equalTo(movieLanguageLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        
        addSubview(seatFullUIView)
        seatFullUIView.snp.makeConstraints { make in
            make.top.equalTo(hourcollectionview.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        addSubview(seatFullLabel)
        seatFullLabel.snp.makeConstraints { make in
            make.top.equalTo(seatFullUIView.snp.top)
            make.leading.equalTo(seatFullUIView.snp.trailing).offset(5)
        }
        
        
        addSubview(seatChosenUIView)
        seatChosenUIView.snp.makeConstraints { make in
            make.top.equalTo(hourcollectionview.snp.bottom).offset(10)
            make.leading.equalTo(seatFullLabel.snp.trailing).offset(20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        addSubview(seatChoseLabel)
        seatChoseLabel.snp.makeConstraints { make in
            make.top.equalTo(seatChosenUIView.snp.top)
            make.leading.equalTo(seatChosenUIView.snp.trailing).offset(5)
           
        }
        
        
        addSubview(seatEmptyUIView)
        seatEmptyUIView.snp.makeConstraints { make in
            make.top.equalTo(hourcollectionview.snp.bottom).offset(10)
            make.leading.equalTo(seatChoseLabel.snp.trailing).offset(20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        addSubview(seatEmptyLabel)
        seatEmptyLabel.snp.makeConstraints { make in
            make.top.equalTo(seatEmptyUIView.snp.top)
            make.leading.equalTo(seatEmptyUIView.snp.trailing).offset(5)

        }
        
        
        addSubview(screneLabel)
        screneLabel.snp.makeConstraints { make in
            make.top.equalTo(seatFullUIView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
        
        
        addSubview(seatListTableView)
        seatListTableView.snp.makeConstraints { make in
            make.top.equalTo(screneLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
