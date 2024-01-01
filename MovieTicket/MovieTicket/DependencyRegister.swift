import Foundation
import HomeModule
import MovieDetail
import DependenyKit
import HallsAndSessionsModule
import ChooseSeatModule


final class DependencyRegister {
    func registerDependencies(){
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModuleInterface.self)
        dependencyRegister.register(value: MovieDetailRouter(), for: MovieDetailModuleInterface.self)
        dependencyRegister.register(value: HallsAndSessionsRouter(), for: HallsAndSessionsModuleInterface.self)
        dependencyRegister.register(value: ChooseSeatRouter(), for: ChooseSeatModuleInterface.self)
    }
}
