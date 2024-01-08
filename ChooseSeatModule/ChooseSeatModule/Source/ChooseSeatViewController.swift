import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ViewControllerAbleKit
import ThemeKit

typealias Ables = UIViewAble & SegueAble & NavConUIAble

protocol ChooseSeatViewControllerInterface : AnyObject,Ables {
    var presenter : ChooseSeatPresenterInterface {get}
    
    func prepareCollectionView()
    func reloadCollecionView()
}

final class ChooseSeatViewController : UIViewController {
    lazy var presenter : ChooseSeatPresenterInterface = ChooseSeatPresenter(view: self)
    
    private lazy var chooseSeatView = ChooseSeatView()
    
    override func loadView() {
        view = chooseSeatView
        chooseSeatView.delegate = self
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

extension ChooseSeatViewController : ChooseSeatViewDelegate {
    func payNowButtonTappedDelegate() {
        presenter.toPaymentPage()
    }
    
    
}
    
    




