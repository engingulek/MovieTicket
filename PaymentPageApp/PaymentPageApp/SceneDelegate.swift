//
//  SceneDelegate.swift
//  PaymentPageApp
//
//  Created by engin gülek on 3.01.2024.
//

import UIKit
import DependenyKit
import PaymentPageModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: PaymenPageRouter(), for: PaymentPageModuleInterface.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var paymentPageModule : PaymentPageModuleInterface
        window?.rootViewController = paymentPageModule.createModule()
        window?.makeKeyAndVisible()
    }


}

