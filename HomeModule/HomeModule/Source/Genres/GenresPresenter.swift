import Foundation

protocol GenresPresenterInterface {
    var view : GenresCVInterface? {get}
    var interactor : GenresInteractorProtocol {get}
    
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func  cellForItemAt(at indexPath:IndexPath) -> Genres
}

class GenresPresenter : GenresPresenterInterface {
    
    var view: GenresCVInterface?
    var interactor: GenresInteractorProtocol
    
    private var genres : [Genres] = []
    
    init(view: GenresCVInterface, interactor: GenresInteractorProtocol = GenresInteractor.shared) {
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Fetch Genres
    private func fetchGenres() async {
        do{
            let result = try await interactor.fetchGenres()
            genres = result
            print("Genres Data : \(genres)")
            view?.realoadData()
        }catch{
            print("Genres Data : \(error.localizedDescription)")
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
