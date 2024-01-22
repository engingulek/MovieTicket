
import Foundation
import ThemeKit
import ModelKit

protocol SearchMoviePresenterInterface {
    var view : SearchMovieViewControllerInterface? {get}
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
    private var router: SearchMovieRouterInterface?
    private var interactor : SearchViewInteractorProtocol
    var searchText : String = Theme.theme.themeText.defaultText
    
    private var sections:[String] = [
        Theme.theme.themeText.movieInCinema,
        Theme.theme.themeText.future]
    
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
        view?.startAnimatigIndicator()
        do {
            let result = try await interactor.searchMovieInCinema()
            if searchText.isEmpty {
                movieInCinemaList = result
            }else{
                movieInCinemaList =  result.filter{
                    $0.name.contains(searchText)
                }
            }
            view?.stopAnimatingIndicator()
            view?.relaodTableView()
            
        }catch{
            movieInCinemaList = []
            view?.relaodTableView()
        }
    }
    
    
    private func searchFutureSinema() async {
        view?.startAnimatigIndicator()
        do {
            let result = try await interactor.searchFutureMovie()
            
            if searchText.isEmpty {
                futureCinemaList  = result
            }else{
                futureCinemaList  =  result.filter{
                    $0.name.contains(searchText)
                }
            }
            view?.stopAnimatingIndicator()
            view?.relaodTableView()
        }catch{
            futureCinemaList = []
            view?.stopAnimatingIndicator()
            view?.relaodTableView()
        }
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: Theme.theme.themeColor.primaryBackground)
        view?.navigationBarHidden(isHidden: false)
        view?.changeTintColor(color: Theme.theme.themeColor.primaryLabel)
        view?.changeTitle(title: Theme.theme.themeText.navTitleSearchMovie)
        view?.prepareTableView()
        view?.relaodTableView()
        view?.searchTextfieldText(searchText: searchText)
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
        return sections[section]
    }
    
    func heightForHeaderInSection() -> CGFloat {
        return 40
    }
    
    func textDidChange(text: String) {
        searchText = text
        Task {
            @MainActor in
            await searchMovieInCinema()
            await searchFutureSinema()
        }
    }
    
    
}
