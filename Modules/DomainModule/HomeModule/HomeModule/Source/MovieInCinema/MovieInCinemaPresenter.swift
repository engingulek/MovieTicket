import Foundation
import ModelKit
protocol MovieInCinemaPresenterInterface {
    var view : MovieInCinemaCVInterface? {get}
    
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func cellForItemAt(at indexPath:IndexPath) -> MovieResult
    func didSelectItem(at indexPath:IndexPath) -> MovieResult
    
}


class MovieInCinemaPresenter : MovieInCinemaPresenterInterface {
   
    weak var view: MovieInCinemaCVInterface?
    private var interactor : HomeInteractorProtocol
    private var movieInCinema : [MovieResult] = []
    
    init(view: MovieInCinemaCVInterface? ,
        interactor: HomeInteractorProtocol = HomeInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchMoveiInCinema() async {
        view?.startAnimatigIndicator()
        do{
            let result = try await interactor.fetchMovieInCinema()
            movieInCinema = result
            if movieInCinema.isEmpty {
                view?.messageWithLabel(text: "No Movie")
            }else{
                view?.messageWithLabel(text: "")
            }
            view?.stopAnimatingIndicator()
            view?.realoadData()
        }catch{
            view?.stopAnimatingIndicator()
            movieInCinema = []
            view?.messageWithLabel(text: "Something went wrong")
            view?.realoadData()
        }
    }
    
    func viewDidLoad() {
        Task{
            @MainActor in
            await fetchMoveiInCinema()
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return movieInCinema.count
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> MovieResult {
        let movie = movieInCinema[indexPath.item]
        return movie
    }
    
    func didSelectItem(at indexPath: IndexPath) -> ModelKit.MovieResult {
        let movie = movieInCinema[indexPath.item]
        return movie
    }
}
