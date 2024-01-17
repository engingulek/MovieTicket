import Foundation
import UIKit
import PaymentPageModule
import DependenyKit
protocol ChooseSeatRouterInterface {
    func toPaymentPage(view:ChooseSeatViewControllerInterface?,ticketInfo:[String:Any])
}

public final class ChooseSeatRouter : ChooseSeatModuleInterface {
    public init(){}
    public func createModule(hallAndSessionId:Int,languageId:Int)-> UIViewController {
        let view = ChooseSeatViewController()
        let router = ChooseSeatRouter()
        let presenter = ChooseSeatPresenter(view: view,
                                    router: router)
        presenter.hallAndSessionId = hallAndSessionId
        presenter.languageId = languageId
        view.presenter = presenter
        return view
    }
}
extension ChooseSeatRouter : ChooseSeatRouterInterface {
    func toPaymentPage(view: ChooseSeatViewControllerInterface?,ticketInfo:[String:Any]) {
        @Dependency var paymentPageModule : PaymentPageModuleInterface
        let viewController = paymentPageModule.createModule(ticketInfo: ticketInfo)
        view?.pushViewControllerAble(
            viewController,
            animated: true)
    } 
}
