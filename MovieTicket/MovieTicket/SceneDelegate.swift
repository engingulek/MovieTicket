//
//  SceneDelegate.swift
//  MovieTicket
//
//  Created by engin gülek on 26.12.2023.
//

import UIKit
import DependenyKit
import HomeModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependenyRegister = DependencyRegister()
        dependenyRegister.registerDependencies()
              window = UIWindow(frame: windowScene.coordinateSpace.bounds)
              window?.windowScene = windowScene
        @Dependency var homeModule : HomeModuleInterface
        window?.rootViewController = UINavigationController(rootViewController: homeModule .createHomeModule())
              window?.makeKeyAndVisible()
          }
}




