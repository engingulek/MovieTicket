
import Foundation
import UIKit
import ThemeKit
import ViewControllerAbleKit

typealias Ables = UIViewAble & NavConUIAble & SegueAble & TabbarConAble

protocol TicketListViewControllerInterface : AnyObject,Ables {
    
}


final class TicketListTableViewController : UITableViewController {
    lazy var presenter : TicketListPresenterInterface = TicketListPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TicketListTVC.self, forCellReuseIdentifier: TicketListTVC.identifier)
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    override func tableView(_ tableView: UITableView, 
                      numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(
        withIdentifier: TicketListTVC.identifier,
        for: indexPath) as? TicketListTVC else {return UITableViewCell()}
        return cell
    }
    
    override func tableView(_ tableView: UITableView, 
                        didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
        
    }
}

extension TicketListTableViewController : TicketListViewControllerInterface {
    
}




