
import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ViewControllerAbleKit
import ThemeKit


typealias Ables = UIViewAble & SegueAble & NavConUIAble

protocol SearchMovieViewControllerInterface :  AnyObject,Ables {
    var presenter : SearchMoviePresenterInterface {get}
    func prepareTableView()
    func relaodTableView()
    func searchTextfieldText(searchText:String)
}

final class SearchMovieViewController : UIViewController {
    lazy var presenter : SearchMoviePresenterInterface = SearchMoviePresenter(view: self)
    lazy var searchMovieView = SearchMovieView()
    
    override func loadView() {
        view = searchMovieView
        
    }
    
    override func viewDidLoad() {
        presenter.viewDidLoad()
    }
}

extension SearchMovieViewController : SearchMovieViewControllerInterface {
   
    
    func prepareTableView() {
        searchMovieView.prepareTableView(view: self)
    }
    
    
    func searchTextfieldText(searchText:String) {
        searchMovieView.configureView(searhtext: searchText)
    }
    
    func relaodTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            searchMovieView.reloadTableView()
        }
    }
}

extension SearchMovieViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchMovieTVC.identifier,for: indexPath) as? SearchMovieTVC else {return UITableViewCell()}
        cell.selectionStyle = .none
        let movie = presenter.cellForRow(at: indexPath)
        cell.configureData(movieResult: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = Theme.theme.themeColor.primaryBackground
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width, height: headerView.frame.height-10)
        let title =  presenter.viewForHeaderInSection(section: section)
        label.text = title
        label.font = Theme.theme.themeFont.secondaryFont
        label.textColor = Theme.theme.themeColor.primaryLabel
        
        headerView.addSubview(label)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return presenter.heightForHeaderInSection()
    }
}


