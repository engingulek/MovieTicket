
import Foundation
import UIKit
import ThemeKit
protocol TicketListViewControllerInterface : AnyObject {
    
}


final class TicketListTableViewController : UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TicketListTVC.self, forCellReuseIdentifier: TicketListTVC.identifier)
        tableView.backgroundColor =  Theme.theme.themeColor.primaryBackground
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
}




