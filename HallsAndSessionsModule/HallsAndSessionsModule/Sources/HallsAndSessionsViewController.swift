
import Foundation
import UIKit
import ViewControllerAbleKit
import SnapKit
import CommenUIKit
import ThemeKit

typealias Ables = UIViewAble & SegueAble
protocol HallsAndSessionsViewControllerInterface : AnyObject,Ables {
    var presenter : HallsAndSessionsPresenterInterface {get}
    
    func prepareCollectionView()
    func reloadCollectionView()
    
    func prepareTableView()
    func reloadTableView()
}

final class HallsAndSessionsViewController : UIViewController {
    private lazy var hallsAndSessionView = HallsAndSessionsView()
    override func loadView() {
        view = hallsAndSessionView
    }
    lazy var presenter: HallsAndSessionsPresenterInterface = HallsAndSessionsPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension HallsAndSessionsViewController : HallsAndSessionsViewControllerInterface {
    
    func prepareCollectionView() {
        hallsAndSessionView.prepareCollectionView(view: self)
    }
    
    func reloadCollectionView() {
        hallsAndSessionView.reloadCollectionView()
    }
    
    
    func prepareTableView() {
        hallsAndSessionView.prepareTableView(view: self)
    }
    
    func reloadTableView() {
        hallsAndSessionView.reloadTableView()
    }
}


extension HallsAndSessionsViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyLabelCVC.identifier, for: indexPath) as? OnlyLabelCVC else {return UICollectionViewCell()}
        cell.configureData(labelText: "Dec/29/2024")
        cell.configureIU(backColor: Theme.theme.themeColor.thirdBack,
                     font: Theme.theme.themeFont.cellLabelFont.boldVersion)
        return cell
    }
}

extension HallsAndSessionsViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 ,
                  height: 60)
    }
}

extension HallsAndSessionsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HallInfoTVC.identifier,for: indexPath) as? HallInfoTVC else {return UITableViewCell()}
        cell.configureData(cinemaName: "Cinema Name",
                       hallNumber: "Hall 2",
                       movieLanguageBase: "English",
                       movieLanguageSubtitle: "Turkish(Subtitle)")
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 6
    }
}


extension HallsAndSessionsViewController : HallınfoTVCDelegate {
    func selectedBaseLanguage() {
        presenter.buyTicketButtonTapped()
    }
    
    func selectedSubLangue() {
        presenter.buyTicketButtonTapped()
    }
}

