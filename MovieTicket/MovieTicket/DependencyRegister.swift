import Foundation


import HomeModule
import DependenyKit


final class DependencyRegister {
    func registerDependencies(){
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModuleInterface.self)
    }
}
