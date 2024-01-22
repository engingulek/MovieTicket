
import Foundation
import ModelKit
protocol FutureMoviePresenterInterface {
    var view : FutureMovieCVInterface? {get}
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func  cellForItemAt(at indexPath:IndexPath) -> MovieResult
    func  didSelectItem(at indexPath:IndexPath) -> MovieResult
}

class FutureMoviePresenterr : FutureMoviePresenterInterface {
    
    weak var view: FutureMovieCVInterface?
    private var interactor : HomeInteractorProtocol
    private var futureMovie : [MovieResult] = []
    
    init(view: FutureMovieCVInterface? ,
        interactor: HomeInteractorProtocol = HomeInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchFutureMovie() async {
        view?.startAnimatigIndicator()
        do{
            let result = try await interactor.fetchFutureMovie()
            futureMovie = result
            if futureMovie.isEmpty {
                view?.messageWithLabel(text: "No Movie")
            }else{
                view?.messageWithLabel(text: "")
            }
            view?.stopAnimatingIndicator()
            view?.realoadData()
        }catch{
            view?.stopAnimatingIndicator()
            futureMovie = []
            view?.messageWithLabel(text: "Something went wrong")
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
    
    func cellForItemAt(at indexPath: IndexPath) -> MovieResult {
        let movie = futureMovie[indexPath.item]
        return movie
    }
    
    func didSelectItem(at indexPath: IndexPath) -> MovieResult {
        let movie = futureMovie[indexPath.item]
        return movie
    }
}
