
import Foundation
import ThemeKit
import ModelKit

protocol SearchMoviePresenterInterface {
    var view : SearchMovieViewControllerInterface? {get}
    var router : SearchMovieRouterInterface? {get}
    func viewDidLoad()
    
    func numberOfSections() -> Int
    func numberOfRowsIn(section :Int) -> Int
    func cellForRow(at indexPath : IndexPath) -> MovieResult
    func viewForHeaderInSection(section:Int) -> String
    func heightForHeaderInSection() -> CGFloat
    func didSelectRow(at indexPath:IndexPath)
    func textDidChange(text:String)
}

class SearchMoviePresenter  {
     var view: SearchMovieViewControllerInterface?
    var router: SearchMovieRouterInterface?
    private var interactor : SearchViewInteractorProtocol
    var searchText : String?
    private var sections:[String] = ["Movie In Cinema","Future Movie"]
    
    private var movieInCinemaList : [MovieResult] = []
    private var futureCinemaList : [MovieResult] = []
    init(view: SearchMovieViewControllerInterface?,
        router : SearchMovieRouterInterface? = nil,
         interactor : SearchViewInteractorProtocol = SearchViewInteractor.shared) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    private func searchMovieInCinema() async {
        do {
           let result = try await interactor.searchMovieInCinema()
            guard let text = searchText else {
                movieInCinemaList = []
                view?.relaodTableView()
                return
            }
            
            if text.isEmpty {
                movieInCinemaList = result
            }else{
                movieInCinemaList =  result.filter{$0.name.contains(searchText ?? "")}
            }
            view?.relaodTableView()
            
        }catch{
            movieInCinemaList = []
            print("Search Movie \(error.localizedDescription)")
            view?.relaodTableView()
        }
    }
    
    
    private func searchFutureSinema() async {
        do {
            let result = try await interactor.searchFutureMovie()
            guard let text = searchText else {
                futureCinemaList  = []
                view?.relaodTableView()
                return
            }
            if text.isEmpty {
                futureCinemaList  = result
            }else{
                futureCinemaList  =  result.filter{
                    $0.name.contains(searchText ?? "")
                }
            }
            view?.relaodTableView()
        }catch{
            futureCinemaList = []
            view?.relaodTableView()
        }
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.navigationBarHidden(isHidden: false)
        view?.changeTintColor(color: Theme.theme.themeColor.primaryLabel)
        view?.changeTitle(title: "Search Movie")
        view?.prepareTableView()
        view?.relaodTableView()
        view?.searchTextfieldText(searchText: searchText ?? "")
        Task {
            @MainActor in
            await searchMovieInCinema()
            await searchFutureSinema()
        }
    }
}


extension SearchMoviePresenter : SearchMoviePresenterInterface{
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRowsIn(section :Int) -> Int {
        if section == 0 {
            return movieInCinemaList.count
        }else if section == 1{
            return futureCinemaList.count
        }else{
            return 0
        }
    }
    
    func cellForRow(at indexPath: IndexPath) -> MovieResult {
        let section = indexPath.section
        
        if section == 0 {
            let row =  indexPath.row
            let movieInCinema = movieInCinemaList[row]
            return movieInCinema
        }else{
            let row =  indexPath.row
            let futureCinema = futureCinemaList[row]
            return futureCinema
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let section = indexPath.section
        if section == 0 {
            let row =  indexPath.row
            let movieInCinema = movieInCinemaList[row]
            router?.toMovieDetail(
                movie: movieInCinema,
                view: view,
                buttonHidden: false)
        }else{
            let row =  indexPath.row
            let futureCinema = futureCinemaList[row]
            router?.toMovieDetail(
                movie: futureCinema,
                view: view,
                buttonHidden: true)
        }
    }
    
    
    
    func viewForHeaderInSection(section: Int) -> String {
        if section == 0 {
            return "Movie In Cinema"
        }else if section == 1{
            return "Future Cinema"
        }else{
            return ""
        }
    }
    
    func heightForHeaderInSection() -> CGFloat {
        return 40
    }
    
    func textDidChange(text: String) {
        print(text)
        searchText = text
        Task {
            @MainActor in
            await searchMovieInCinema()
            await searchFutureSinema()
        }
    }
    

}
