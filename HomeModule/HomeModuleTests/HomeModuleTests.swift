
import XCTest
@testable import HomeModule
import ThemeKit
import CommenUIKit
final class HomeModuleTests: XCTestCase {
    private var view : MockHomeViewController!
    private var presenter : HomePresenter!
    
    override  func setUp() {
        super.setUp()
        view = .init()
        presenter = .init(view: view)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func test_numberOfItemsInSection_ReturnOne() {
        presenter.viewDidLoad()
        
        XCTAssertEqual(presenter.numberOfItemsInSection(), 1)
    }
    
    func test_numberOfSection_ReturnTwo() {
        presenter.viewDidLoad()
        XCTAssertEqual(presenter.numberOfSection(), 2)
    }
    
    func test_cellForItemAt_ReturnMovieInCinemaCell() {
       let cellType = presenter.cellForItemAt(at: .init(item: 0, section: 0))
        
        XCTAssertEqual(cellType, "movieInCinemaCell")
    }
    
    func test_cellForItemAt_ReturnFutureMovieCell() {
       let cellType = presenter.cellForItemAt(at: .init(item: 0, section: 1))
        
        XCTAssertEqual(cellType, "futureMovieCell")
    }
    
    func  test_sizeForItemAt_ReturnMovieInCinemaCellSize() {
        let size = presenter.sizeForItemAt(at: .init(item: 0, section: 0))
        
        XCTAssertEqual(size, CGSize(width: UIScreenView.shared.screenWidth,
                                    height: UIScreenView.shared.screenHeight / 2))
        
    }
    
    func  test_sizeForItemAt_ReturnFutureMovieCellSize() {
        let size = presenter.sizeForItemAt(at: .init(item: 0, section: 1))
        
        XCTAssertEqual(size, CGSize(
            width: UIScreenView.shared.screenWidth,
            height: UIScreenView.shared.screenHeight / 3))
        
    }
    
    
    func test_headerCollectionReuableView_ReturnMovieInCinema(){
        let headerTitle = presenter.headerCollectionReuableView(at: .init(item: 0, section: 0))
        
        XCTAssertEqual(headerTitle, Theme.theme.themeText.movieInCinema)
        XCTAssertEqual(headerTitle, "Movie In Cinema")
    }
    
    func test_headerCollectionReuableView_ReturnFutureMovie(){
        let headerTitle = presenter.headerCollectionReuableView(at: .init(item: 0, section: 1))
        
        XCTAssertEqual(headerTitle, Theme.theme.themeText.future)
        XCTAssertEqual(headerTitle, "Future Movie")
    }
    
    func test_referenceSizeForHeaderInSection_ReturnHeaderSize(){
        let size =  presenter.referenceSizeForHeaderInSection()
        XCTAssertEqual(size, CGSize(width: UIScreenView.shared.screenWidth, height: 50))
    }
        
        
    func test_viewDidLoad_InvokesRequiredMethods(){
        XCTAssertFalse(view.invokedPrapareCollectionView)
        XCTAssertFalse(view.invokedReloadCollectionView)
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedPrepareCollectionViewCount, 1)
        XCTAssertEqual(view.invokedReloadCollectionViewCount, 1)
    }
    
    func test_textAction_WhenDidChaneheSearch_ReturnEmpty(){
        XCTAssertFalse(view.invokedtextFieldAction)
        
        presenter.textDidChange(text: "About Dr")
        
        XCTAssertEqual(view.invokedtextFieldActionCount, 1)
        XCTAssertEqual(view.invokedtextFieldActionParameters?.text, "")
    }
    
    func test_viewDidLoad_setBackColorAble_ReturnBackColor(){
        XCTAssertFalse(view.invokedSetBackColorAble)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedSetBackColorAbleCount, 1)
        XCTAssertEqual(view.invokedSetBackColorAbleParameters?.color, Theme.theme.themeColor.primaryBackground)
    }
    
    func test_viewDidLoad_changeNavBarColor_ReturnNavBarColor(){
        XCTAssertFalse(view.invokedchangeNavBarColor)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedchangeNavBarColorCount, 0)
        XCTAssertEqual(view.invokedchangeNavBarColorParameters?.color, nil)
    }
    
    func test_viewDidLoad_changeTintColor_ReturnTintColor(){
        XCTAssertFalse(view.invokedchangeTintColor)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedchangeTintColorCount, 0)
        XCTAssertEqual(view.invokedchangeTintColorParameters?.color, nil)
    }
    
    func test_viewDidLoad_changeTitle_ReturnTitle(){
        XCTAssertFalse(view.invokedchangeTitle)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedchangeTitleCount, 0)
        XCTAssertEqual(view.invokedchangeTitleParameters?.title, nil)
    }
    
    func test_viewDidLoad_navigationBarHidden_ReturnHidden(){
        XCTAssertFalse(view.invokednavigationBarHidden)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokednavigationBarHiddenCount, 1)
        XCTAssertEqual(view.invokednavigationBarHiddenParameters?.isHidden, true)
    }
}
