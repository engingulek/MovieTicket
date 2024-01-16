import Foundation
import UIKit
import ThemeKit
import ViewControllerAbleKit


enum MaskFormat :String {
    case phoneNumber = "*** *** ** **"
    case cardNumber = "**** **** **** ****"
    case expirationDate = "**/**"
    case securatiyCode = "***"
    case defaultCode = "** *******"
}

typealias Ables = UIViewAble & SegueAble & NavConUIAble

protocol PaymentPageViewControllerInterface : AnyObject,Ables {
    var presenter : PaymentPagePresenterInterface {get}
    func congigureUIForContanctInfo(color:String,tag:Int)
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
    func congigureUIForContanctInfo(color: String, tag: Int) {
        paymetPageView.contactionInfoView.configureUIForAlert(color: color, tag: tag)
    }
    
    
}


extension PaymentPageViewController : PaymentPageViewDelegate {
    func buyTicketButtonTapped() {
        let infos = paymetPageView.returnInfos()
        presenter.buyTicketButtonTapped(contanctInfo:infos.contanctInfo,
                              cardInfo:infos.cardInfo)
    }
    
    
}
