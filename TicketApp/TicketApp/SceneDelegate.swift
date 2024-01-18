

import UIKit
import DependenyKit
import TicketModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: TicketRouter(), for: TicketModuleInterface.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var ticketModule : TicketModuleInterface
        window?.rootViewController = ticketModule.createModule(barcode: 100000000)
        window?.makeKeyAndVisible()
    }




}

