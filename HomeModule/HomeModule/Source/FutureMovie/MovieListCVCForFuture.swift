import UIKit
import SnapKit

final class MovieListCVCForFuture : UICollectionViewCell {
    static let idetifier : String = "movieListCVCForFuture"
    private let futureMovieCV = FutureMovieCV()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(futureMovieCV.view)
        futureMovieCV.view.snp.makeConstraints { make in
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
