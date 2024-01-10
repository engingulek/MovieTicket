// FutureMoviePresenter

import Foundation


protocol FutureMoviePresenterInterface {
    var view : FutureMovieCVInterface? {get}
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func  cellForItemAt(at indexPath:IndexPath) -> Movie
    
}


class FutureMoviePresenterr : FutureMoviePresenterInterface {
    var view: FutureMovieCVInterface?
    private var interactor : HomeInteractorProtocol
    private var futureMovie : [Movie] = []
    
    init(view: FutureMovieCVInterface? ,
        interactor: HomeInteractorProtocol = HomeInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchFutureMovie() async {
        do{
            let result = try await interactor.fetchFutureMovie()
            futureMovie = result
            print("Future \(futureMovie)")
            view?.realoadData()
        }catch{
            futureMovie = []
            view?.realoadData()
            
        }
    }
    
    
    func viewDidLoad() {
        Task{
            @MainActor in
            await fetchFutureMovie()
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return futureMovie.count
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> Movie {
        let movie = futureMovie[indexPath.item]
        return movie
    }
}
