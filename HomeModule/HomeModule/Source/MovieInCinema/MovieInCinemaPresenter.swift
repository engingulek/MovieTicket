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
   
    
    var view: MovieInCinemaCVInterface?
    private var interactor : HomeInteractorProtocol
    private var movieInCinema : [MovieResult] = []
    
    init(view: MovieInCinemaCVInterface? ,
        interactor: HomeInteractorProtocol = HomeInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchMoveiInCinema() async {
        do{
            let result = try await interactor.fetchMovieInCinema()
            movieInCinema = result
            view?.realoadData()
        }catch{
            movieInCinema = []
            
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
