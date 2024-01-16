import Foundation
import UIKit
import SnapKit
import ThemeKit

protocol PaymentPageViewDelegate {
    func buyTicketButtonTapped()
}


final class PaymentPageView : UIView{
    
    private lazy var movieAndTicketView = MovieAndTicketInfoView()
     lazy var contactionInfoView = ContactinfoView()
   lazy var cardInfoView = CardInfoView()
    var delegate : PaymentPageViewDelegate?
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var  scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        view.backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cardInfoView.delegate = self
        backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        scrollView.addSubview(scrollStackViewContainer)
        
        scrollStackViewContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        [movieAndTicketView,
         contactionInfoView,
         cardInfoView].forEach { view in
            scrollStackViewContainer.addArrangedSubview(view)
        }
    }
    
    func returnInfos() -> (contanctInfo:ContanctInfo,cardInfo:CardInfo){
        let contanctInfo:ContanctInfo = contactionInfoView.returnContactInfo()
        let cardInfo:CardInfo = cardInfoView.returnCardInfo()
        
        return(contanctInfo,cardInfo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PaymentPageView : CardInfoViewDelegate  {
    func buyTicketButtonTapped() {
        delegate?.buyTicketButtonTapped()
    }
    
    
}
