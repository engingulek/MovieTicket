import UIKit
import SnapKit
import ModelKit
protocol MovieListCVCForInCinemeDelegate {
    func selectedMovieInCinema(movie:MovieResult)
}


final class MovieListCVCForInCineme : UICollectionViewCell {
    static let idetifier : String = "movieListCVCForInCineme"
    private let movieInCinemaCV = MovieInCinemaCV()
    var delegate : MovieListCVCForInCinemeDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(movieInCinemaCV.view)
        movieInCinemaCV.delegate = self
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


extension MovieListCVCForInCineme : MovieInCinemaCVDelegate {
    func selectedMovie(movie:MovieResult) {
        self.delegate?.selectedMovieInCinema(movie:movie)
    }
}
