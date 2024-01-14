import Foundation

import HomeModule
import MovieDetail
import DependenyKit
import HallsAndSessionsModule
import ChooseSeatModule
import PaymentPageModule

import TicketModule
import SearchMovie



final class DependencyRegister {
    func registerDependencies(){
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModuleInterface.self)
        dependencyRegister.register(value: MovieDetailRouter(), for: MovieDetailModuleInterface.self)
        dependencyRegister.register(value: HallsAndSessionsRouter(), for: HallsAndSessionsModuleInterface.self)
        dependencyRegister.register(value: ChooseSeatRouter(), for: ChooseSeatModuleInterface.self)
        dependencyRegister.register(value: PaymenPageRouter(), for: PaymentPageModuleInterface.self)
        dependencyRegister.register(value: TicketRouter(), for: TicketModuleInterface.self)
        dependencyRegister.register(value: SearchMovieRouter(), for: SearcMovieModuleInterface.self)
    }
}
