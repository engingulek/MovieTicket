import UIKit
import SnapKit
import ThemeKit
import CommenUIKit
import ViewControllerAbleKit


typealias Ables = UIViewAble & NavConUIAble 

protocol TicketViewControllerInterface : AnyObject,Ables {
    var presenter : TicketPresenterInterface {get}
}

final class TicketViewController : UIViewController {
   lazy var presenter: TicketPresenterInterface = TicketPresenter(view: self)
    private lazy var ticketView = TicketView()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.addSubview(ticketView)
        ticketView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
}

extension TicketViewController : TicketViewControllerInterface{
   
    
    
}
