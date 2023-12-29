//
//  SceneDelegate.swift
//  HallsAndSessionsApp
//
//  Created by engin gülek on 29.12.2023.
//

import UIKit
import DependenyKit
import HallsAndSessionsModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, 
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HallsAndSessionsRouter(), for: HallsAndSessionsModuleInterface.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var hallsAndSessionsModule : HallsAndSessionsModuleInterface
        window?.rootViewController = hallsAndSessionsModule.createModule()
        window?.makeKeyAndVisible()
    }

 

}

