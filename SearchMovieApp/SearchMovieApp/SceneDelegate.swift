import UIKit
import DependenyKit
import SearchMovie
import ThemeKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: SearchMovieRouter(), for: SearcMovieModuleInterface.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var searcMovieModule : SearcMovieModuleInterface
        window?.rootViewController = searcMovieModule.createModule(searchText: Theme.theme.themeText.defaultText)
        window?.makeKeyAndVisible()
    }
}

