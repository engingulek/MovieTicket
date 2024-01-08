
import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ViewControllerAbleKit



typealias Ables = UIViewAble & SegueAble & NavConUIAble

protocol SearchMovieViewControllerInterface :  AnyObject,Ables {
    var presenter : SearchMoviePresenterInterface {get}
    func prepareTableView()
    func relaodTableView()
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
    
    func relaodTableView() {
        searchMovieView.reloadTableView()
    }
}

extension SearchMovieViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchMovieTVC.identifier,for: indexPath) as? SearchMovieTVC else {return UITableViewCell()}
       
        return cell
    }
}


