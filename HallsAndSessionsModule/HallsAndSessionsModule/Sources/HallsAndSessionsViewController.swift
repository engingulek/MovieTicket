
import Foundation
import UIKit
import ViewControllerAbleKit
import SnapKit
import CommenUIKit
import ThemeKit

typealias Ables = UIViewAble & SegueAble & NavConUIAble

protocol HallsAndSessionsViewControllerInterface : AnyObject,Ables {
    var presenter : HallsAndSessionsPresenterInterface {get}
    
    func prepareCollectionView()
    func reloadCollectionView()
    
    func prepareTableView()
    func reloadTableView()
    
    func startAnimatigIndicator()
    func stopAnimatingIndicator()
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

//MARK: HallsAndSessionsViewControllerInterface
extension HallsAndSessionsViewController : HallsAndSessionsViewControllerInterface {

    func prepareCollectionView() {
        hallsAndSessionView.prepareCollectionView(view: self)
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            hallsAndSessionView.reloadCollectionView()
        }
    }
    func prepareTableView() {
        hallsAndSessionView.prepareTableView(view: self)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            hallsAndSessionView.reloadTableView()
        }
    }
    
    func startAnimatigIndicator() {
        hallsAndSessionView.startAnimatigIndicator()
    }
    
    func stopAnimatingIndicator() {
        hallsAndSessionView.stopAnimatingIndicator()
    }
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension HallsAndSessionsViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, 
                    numberOfItemsInSection section: Int) -> Int {
        
        return presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnlyLabelCVC.identifier,
            for: indexPath) as? OnlyLabelCVC else {return UICollectionViewCell()}
        
        let item = presenter.cellForItem(at: indexPath)
        cell.configureData(labelText:item.date)
        cell.configureIU(backColor: item.backColor, 
                         labelColor: item.labelColor,
                     font: Theme.theme.themeFont.cellLabelFont.boldVersion)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension HallsAndSessionsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: UIScreen.main.bounds.width / 2 ,
                  height: 60)
    }
}

//MARK: UITableViewDelegate,UITableViewDataSource
extension HallsAndSessionsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HallInfoTVC.identifier,
            for: indexPath) as? HallInfoTVC else {return UITableViewCell()}
        
        let hallAndSession =  presenter.cellForRow(at: indexPath)
        cell.configureData(hallAndSession: hallAndSession)
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 6
    }
}

//MARK: HallınfoTVCDelegate
extension HallsAndSessionsViewController : HallınfoTVCDelegate {
    func selectedBaseLanguage(row: Int, baseLanguageId: Int) {
        presenter.hallAndSessionSelected(row: row, languageId: baseLanguageId)
    }
    
    func selectedSubLangue(row: Int, subLanguageId: Int) {
        presenter.hallAndSessionSelected(row: row, languageId: subLanguageId)
    }
}

