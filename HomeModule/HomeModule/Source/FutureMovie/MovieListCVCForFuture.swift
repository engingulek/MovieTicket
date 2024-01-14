import UIKit
import SnapKit
import ModelKit

protocol  MovieListCVCForFutureDelegate {
    func selectedFutureMovie(movie:MovieResult)
}

final class MovieListCVCForFuture : UICollectionViewCell {
    static let idetifier : String = "movieListCVCForFuture"
    private let futureMovieCV = FutureMovieCV()
    var delegate : MovieListCVCForFutureDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(futureMovieCV.view)
        futureMovieCV.delegate = self
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

extension MovieListCVCForFuture : FutureMovieCVDelegate {
    func selectedMovie(movie: MovieResult) {
        self.delegate?.selectedFutureMovie(movie: movie)
    }
    
    
}
