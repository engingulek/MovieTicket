import XCTest
@testable import SearchMovie
import ThemeKit
import CommenUIKit
import ModelKit

final class SearchMovieTests : XCTestCase  {
    private var view : MockSearchMovieController!
    private var interactor : MockSearchViewInteractor!
    private var presenter : SearchMoviePresenter!
    
    override func setUp() {
        view = .init()
        interactor = .init()
        presenter = .init(view: view,interactor: interactor)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_starAnimating_WhenSearching(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedstartAnimatigIndicator)
        let mockData = MovieResult.defaultData
        interactor.mockMovieResultData.append(mockData)
        presenter.textDidChange(text: "Search")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedstartAnimatigIndicatorCount, 2)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func test_stopAnimating_WhenSearching(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedstopAnimatingIndicator)
        let mockData = MovieResult.defaultData
        interactor.mockMovieResultData.append(mockData)
        presenter.textDidChange(text: "Search")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedstopAnimatingIndicatorCount, 2)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    
    func test_numberOfSections_ReturnTwo(){
        presenter.viewDidLoad()
        XCTAssertEqual(presenter.numberOfSections(), 2)
    }
    
    func test_viewForHeaderInSection_ReturnMovieInCinema(){
        let result = presenter.viewForHeaderInSection(section: 0)
        XCTAssertEqual(result,Theme.theme.themeText.movieInCinema)
    }
    
    
    func test_viewForHeaderInSection_ReturnFutureMovie(){
        let result = presenter.viewForHeaderInSection(section: 1)
        XCTAssertEqual(result,Theme.theme.themeText.future)
    }
    
    func test_heightForHeaderInSection_ReturnFourty(){
        XCTAssertEqual(presenter.heightForHeaderInSection(),40)
    }
    
    func test_viewDidLoad_prepareTableView() {
        XCTAssertFalse(view.invokedprepareTableView)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedprepareTableViewount, 1)
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
        
        XCTAssertEqual(view.invokedchangeTintColorCount, 1)
        XCTAssertEqual(view.invokedchangeTintColorParameters?.color, Theme.theme.themeColor.primaryLabel)
    }
    
    func test_viewDidLoad_changeTitle_ReturnTitle(){
        XCTAssertFalse(view.invokedchangeTitle)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedchangeTitleCount, 1)
        XCTAssertEqual(view.invokedchangeTitleParameters?.title, Theme.theme.themeText.navTitleSearchMovie)
    }
    
    func test_viewDidLoad_navigationBarHidden_ReturnHidden(){
        XCTAssertFalse(view.invokednavigationBarHidden)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokednavigationBarHiddenCount, 1)
        XCTAssertEqual(view.invokednavigationBarHiddenParameters?.isHidden, false)
    }
    
    
    func test_viewDidLoad_setBackColorAble_ReturnBackColor(){
        XCTAssertFalse(view.invokedSetBackColorAble)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedSetBackColorAbleCount, 1)
        XCTAssertEqual(view.invokedSetBackColorAbleParameters?.color, Theme.theme.themeColor.primaryBackground)
    }
    
}
