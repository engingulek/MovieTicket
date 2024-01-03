import Foundation
import UIKit
import HomeModule
import DependenyKit
import ThemeKit
final class TabbarController : UITabBarController {
    private lazy var homeViewController : UIViewController = {
        @Dependency var homeModule : HomeModuleInterface
        let vc = UINavigationController(rootViewController: homeModule.createHomeModule())
        vc.tabBarItem.image = UIImage(systemName: "house.fill")
        vc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = Theme.theme.themeColor.secondaryBack
        viewControllers = [
        homeViewController
        ]
    }
}
