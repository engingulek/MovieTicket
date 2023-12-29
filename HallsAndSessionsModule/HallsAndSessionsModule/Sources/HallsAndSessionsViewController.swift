
import Foundation
import UIKit
import ViewControllerAbleKit
import SnapKit
import CommenUIKit

typealias Ables = UIViewAble
protocol HallsAndSessionsViewControllerInterface : AnyObject,Ables {
    var presenter : HallsAndSessionsPresenterInterface {get}
    
    func prepareCollectionView()
    func reloadCollectionView()
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
}


extension HallsAndSessionsViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyLabelCVC.identifier, for: indexPath) as? OnlyLabelCVC else {return UICollectionViewCell()}
        cell.configureData(labelText: "Dec/29/2024")
        return cell
    }
}

extension HallsAndSessionsViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 ,
                        height: 80)
    }
}
