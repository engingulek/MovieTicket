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
    
    func configureMovieInfo(info:ChooseHallAndSessionInfo)
    func seatIndos(info:[SeatsInfo],selectedInfo:[SeatsInfo])
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
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            chooseSeatView.reloadDataCollectionView()
        }
       
    }
    
    func configureMovieInfo(info:ChooseHallAndSessionInfo) {
        DispatchQueue.main.async {
            self.chooseSeatView.configureMovieInfo(info: info)
        }
    }
    
    func seatIndos(info: [SeatsInfo],selectedInfo:[SeatsInfo]) {
        chooseSeatView.seatDesing(seatInfo: info,selectedInfo:selectedInfo)
    }
}


extension ChooseSeatViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyLabelCVC.identifier, for: indexPath) as? OnlyLabelCVC else {return UICollectionViewCell()}
        let item = presenter.cellForItem(at: indexPath)
        cell.configureData(labelText: item.hour.hour)
        cell.configureIU(backColor: item.backColor,
                         labelColor: item.labelColor,
                     font: Theme.theme.themeFont.cellLabelFont.boldVersion)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, 
                    didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}

extension ChooseSeatViewController : ChooseSeatViewDelegate {
    func chooseSeat(chooseSeatInfo: SeatsInfo) {
        presenter.addSelectedInfos(chooseInfo: chooseSeatInfo)
    }
    
    func payNowButtonTappedDelegate() {
        presenter.toPaymentPage()
    }
    
    
}
    
    




