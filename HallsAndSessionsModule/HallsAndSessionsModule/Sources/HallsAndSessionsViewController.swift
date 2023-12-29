
import Foundation
import UIKit
import ViewControllerAbleKit
import SnapKit

typealias Ables = UIViewAble
protocol HallsAndSessionsViewControllerInterface : AnyObject,Ables {
    var presenter : HallsAndSessionsPresenterInterface {get}
}


final class HallsAndSessionsViewController : UIViewController {
    
    lazy var presenter: HallsAndSessionsPresenterInterface = HallsAndSessionsPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}


extension HallsAndSessionsViewController : HallsAndSessionsViewControllerInterface {
    
}
