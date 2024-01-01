import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ViewControllerAbleKit
import ThemeKit

typealias Ables = UIViewAble

protocol ChooseSeatViewControllerInterface : AnyObject,Ables {
    var presenter : ChooseSeatPresenterInterface {get}
    func prepareTableView()
    func reloadTableView()
    
    func prepareCollectionView()
    func reloadCollecionView()
}

final class ChooseSeatViewController : UIViewController {
    lazy var presenter : ChooseSeatPresenterInterface = ChooseSeatPresenter(view: self)
    
    private lazy var chooseSeatView = ChooseSeatView()
    
    override func loadView() {
        view = chooseSeatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension ChooseSeatViewController : ChooseSeatViewControllerInterface {
    func prepareCollectionView() {
        chooseSeatView.prepareCollectionView(view: self)
    }
    
    func reloadCollecionView() {
        chooseSeatView.reloadDataCollectionView()
    }
    
    func prepareTableView() {
        chooseSeatView.prepareTableView(view: self)
    }
    
    func reloadTableView() {
        chooseSeatView.reloadDataTableView()
    }
    
   

}

extension ChooseSeatViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SeatInfoTVC.identifier,
            for: indexPath) as? SeatInfoTVC else {return UITableViewCell()}
        cell.configureData(squenceData: indexPath.row,seatCount: 10)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 15
    }
}


extension ChooseSeatViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyLabelCVC.identifier, for: indexPath) as? OnlyLabelCVC else {return UICollectionViewCell()}
        cell.configureData(labelText: "12:40")
        cell.configureIU(backColor: Theme.theme.themeColor.thirdBack,
                     font: Theme.theme.themeFont.cellLabelFont.boldVersion)
        return cell
    }
}
    
    




