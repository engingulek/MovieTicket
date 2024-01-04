import Foundation
import UIKit
import HomeModule
import TicketListModule
import DependenyKit
import ThemeKit
final class TabbarController : UITabBarController {
    private lazy var homeViewController : UIViewController = {
        @Dependency var homeModule : HomeModuleInterface
        let vc = UINavigationController(rootViewController: homeModule.createHomeModule())
        vc.tabBarItem.image = UIImage(systemName: "house.fill")
        vc.tabBarItem.selectedImage = UIImage(systemName:"house.fill")?.withTintColor(
            Theme.theme.themeColor.thirdBack,
            renderingMode: .alwaysOriginal)
        return vc
    }()
    
    private lazy var ticketListController : UINavigationController = {
        @Dependency var ticketListModule : TicketListModuleInterface
        let vc = UINavigationController(rootViewController: ticketListModule.createModule())
        vc.tabBarItem.image = UIImage(systemName: "list.dash")?.withTintColor(
            .gray,
            renderingMode: .alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(systemName: "list.dash")?.withTintColor(
            Theme.theme.themeColor.thirdBack,
            renderingMode: .alwaysOriginal)
        return vc
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // tabBarController?.tabBar.backgroundColor = Theme.theme.themeColor.secondaryBack
       
        viewControllers = [
        homeViewController,
        ticketListController
        ]
    }
}
