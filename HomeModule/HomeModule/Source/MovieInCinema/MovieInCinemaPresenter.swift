import Foundation

protocol MovieInCinemaPresenterInterface {
    var view : MovieInCinemaCVInterface? {get}
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func  cellForItemAt(at indexPath:IndexPath) -> Movie
    
}


class MovieInCinemaPresenter : MovieInCinemaPresenterInterface {
    var view: MovieInCinemaCVInterface?
    private var interactor : HomeInteractorProtocol
    private var movieInCinema : [Movie] = []
    
    init(view: MovieInCinemaCVInterface? ,
        interactor: HomeInteractorProtocol = HomeInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchMoveiInCinema() async {
        do{
            let result = try await interactor.fetchMovieInCinema()
            movieInCinema = result
            print("Data \(movieInCinema)")
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
    
    func cellForItemAt(at indexPath: IndexPath) -> Movie {
        let movie = movieInCinema[indexPath.item]
        return movie
    }
}
