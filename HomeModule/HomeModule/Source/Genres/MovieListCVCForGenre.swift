import UIKit
import SnapKit
final class MovieListCVCForGenre : UICollectionViewCell {
    static let idetifier : String = "movieListCVCForGenre"
    private let genreCV = GenresCV()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(genreCV.view)
        genreCV.view.snp.makeConstraints { make in
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
