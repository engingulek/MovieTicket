
import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ThemeKit
final class HallsAndSessionsView : UIView {
    
    private lazy var datecollectionview : UICollectionView  = {
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
    
    
    private lazy var hallsInfoTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(HallInfoTVC.self,
                           forCellReuseIdentifier: HallInfoTVC.identifier)
        tableView.allowsMultipleSelection = true
        tableView.backgroundColor = Theme.theme.themeColor.primaryBackground
        return tableView
    }()
    
    
    func prepareCollectionView(view:HallsAndSessionsViewController){
        datecollectionview.delegate = view
        datecollectionview.dataSource = view
    }
    
    func reloadCollectionView(){
        datecollectionview.reloadData()
    }
    
    func prepareTableView(view:HallsAndSessionsViewController){
        hallsInfoTableView.delegate = view
        hallsInfoTableView.dataSource = view
    }
    
    func reloadTableView(){
        hallsInfoTableView.reloadData()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(datecollectionview)
        datecollectionview.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        addSubview(hallsInfoTableView)
        hallsInfoTableView.snp.makeConstraints { make in
            make.top.equalTo(datecollectionview.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
