import UIKit
import SnapKit
final class MovieListCVCForInCineme : UICollectionViewCell {
    static let idetifier : String = "movieListCVCForInCineme"
    private let movieInCinemaCV = MovieInCinemaCV()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(movieInCinemaCV.view)
        movieInCinemaCV.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
