import UIKit
import SnapKit
import ThemeKit
final class TicketViewController : UIViewController {
    private lazy var ticketView = TicketView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.theme.themeColor.primaryBackground
        view.addSubview(ticketView)
        ticketView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
}
