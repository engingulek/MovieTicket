import UIKit
import SnapKit
import ThemeKit
import CommenUIKit
import ViewControllerAbleKit

typealias Ables = UIViewAble & NavConUIAble 

protocol TicketViewControllerInterface : AnyObject,Ables {
    var presenter : TicketPresenterInterface {get}
    func ticketInfoView(ticket:Ticket)
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
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
        
        let saveButton = UIBarButtonItem(
                title: "Save",
                style: .plain,
                target: self,
                action: #selector(saveButtonTapped))
              self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveButtonTapped() {
        self.navigationController?.isNavigationBarHidden = true
        let captureRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        saveScreenToGallery(in: captureRect)
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    // Save Ticket to Gallery
    func saveScreenToGallery(in rect: CGRect) {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        let capturedImage = renderer.image { (context) in
            UIApplication.shared.keyWindow?.layer.render(in: context.cgContext)
        }
        UIImageWriteToSavedPhotosAlbum(capturedImage, nil, nil, nil)
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: TicketViewControllerInterface
extension TicketViewController : TicketViewControllerInterface{
    func ticketInfoView(ticket: Ticket) {
        ticketView.configureData(ticket: ticket)
    }
}
