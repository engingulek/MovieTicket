import Foundation
import UIKit
import ThemeKit
import ViewControllerAbleKit

typealias Ables = UIViewAble & SegueAble & NavConUIAble

protocol PaymentPageViewControllerInterface : AnyObject,Ables {
    var presenter : PaymentPagePresenterInterface {get}
}


final class PaymentPageViewController : UIViewController {
    lazy var presenter : PaymentPagePresenterInterface = PaymentPagePresenter(view: self)
    private lazy var paymetPageView = PaymentPageView()
    override func loadView() {
        view = paymetPageView
        paymetPageView.delegate = self
    }
    
    override func viewDidLoad() {
        presenter.viewDidLoad()
    }
}

extension  PaymentPageViewController : PaymentPageViewControllerInterface {
    
}


extension PaymentPageViewController : PaymentPageViewDelegate {
    func buyTicketButtonTapped() {
        presenter.buyTicketButtonTapped()
    }
    
    
}
