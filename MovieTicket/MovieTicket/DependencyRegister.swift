import Foundation
import HomeModule
import MovieDetail
import DependenyKit


final class DependencyRegister {
    func registerDependencies(){
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModuleInterface.self)
        dependencyRegister.register(value: MovieDetailRouter(), for: MovieDetailModuleInterface.self)
    }
}
