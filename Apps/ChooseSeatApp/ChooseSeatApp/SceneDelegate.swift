
import UIKit
import ChooseSeatModule
import DependenyKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, 
            willConnectTo session: UISceneSession,
            options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: ChooseSeatRouter(), for: ChooseSeatModuleInterface.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var chooseSeatModule : ChooseSeatModuleInterface
        window?.rootViewController = chooseSeatModule.createModule(hallAndSessionId: 0, languageId: 0)
        window?.makeKeyAndVisible()
    }

 


}

