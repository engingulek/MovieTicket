//
//  SceneDelegate.swift
//  TicletListApp
//
//  Created by engin gülek on 3.01.2024.
//

import UIKit
import DependenyKit
import TicketListModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: TicletListRouter(), for: TicketListModuleInterface.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var ticketListModule : TicketListModuleInterface
        window?.rootViewController = ticketListModule.createModule()
        window?.makeKeyAndVisible()
    }

   


}

