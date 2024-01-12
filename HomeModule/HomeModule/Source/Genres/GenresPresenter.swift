import Foundation

protocol GenresPresenterInterface {
    var view : GenresCVInterface? {get}
    var interactor : HomeInteractorProtocol {get}
    
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func  cellForItemAt(at indexPath:IndexPath) -> Genres
}

class GenresPresenter : GenresPresenterInterface {
    
    var view: GenresCVInterface?
    var interactor: HomeInteractorProtocol
    
    private var genres : [Genres] = []
    
    init(view: GenresCVInterface, interactor: HomeInteractorProtocol = HomeInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Fetch Genres
    private func fetchGenres() async {
        do{
            let result = try await interactor.fetchGenres()
            genres = result
            view?.realoadData()
        }catch{
            genres = []
            view?.realoadData()
        }
    }
    
    func viewDidLoad() {
        Task{
            @MainActor in
            await fetchGenres()
        }
    }
}


extension GenresPresenter {
    func numberOfItemsInSection() -> Int {
        return genres.count
    }
    
    func cellForItemAt(at indexPath: IndexPath) -> Genres {
        let genre = genres[indexPath.item]
        return genre
        
    }
}
