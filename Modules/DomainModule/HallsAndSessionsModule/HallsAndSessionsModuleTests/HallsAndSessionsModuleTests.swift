import XCTest
@testable import HallsAndSessionsModule
import ThemeKit
import CommenUIKit

final class HallsAndSessionsModuleTests : XCTestCase  {
    private var view : MockHallsAndSessionsViewController!
    private var interactor :MockHallsAndSessionsInteractor!
    private var presenter : HallsAndSessionsPresenter!
    
    
    override func setUp() {
        view = .init()
        interactor = .init()
        presenter = .init(view: view,interactor: interactor)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_WhenViewDidLoad_filterHallsAndSessionsFilterDate_ReturnData() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedmessageText)
        interactor.filterHallsAndSessionsShouldReturnError  = false
        let mockData = HallAndSession.defaultData
        
        interactor.mocResultData.append(mockData)
        
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedmessageTextCount, 1)
            XCTAssertEqual(self.view.invokedmessageTextParameters?.text,"")
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func test_WhenViewDidLoad_filterHallsAndSessionsFilterDate_ReturnEmpty() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedmessageText)
        interactor.filterHallsAndSessionsShouldReturnError  = false
        
        interactor.mocResultData = []
        
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedmessageTextCount, 1)
            XCTAssertEqual(self.view.invokedmessageTextParameters?.text,"No Hall And Session")
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_WhenViewDidLoad_filterHallsAndSessionsFilterDate_ReturnError() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedmessageText)
        interactor.filterHallsAndSessionsShouldReturnError  = true
        
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedmessageTextCount, 1)
            XCTAssertEqual(self.view.invokedmessageTextParameters?.text,"Something went wrong")
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func test_viewDidLoad_prepareCollectionView() {
        XCTAssertFalse(view.invokedprepareCollectionView)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedprepareCollectionViewCount, 1)
    }
    
    func test_viewDidLoad_prepareTableView() {
        XCTAssertFalse(view.invokedprepareTableView)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedprepareTableViewount, 1)
    }
    
    
    func test_viewDidLoad_setBackColorAble_ReturnBackColor(){
        XCTAssertFalse(view.invokedSetBackColorAble)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedSetBackColorAbleCount, 1)
        XCTAssertEqual(view.invokedSetBackColorAbleParameters?.color, Theme.theme.themeColor.primaryBackground)
    }
    
    func test_viewDidLoad_changeTitle_ReturnTitle(){
        XCTAssertFalse(view.invokedchangeTitle)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(view.invokedchangeTitleCount, 1)
        XCTAssertEqual(view.invokedchangeTitleParameters?.title, Theme.theme.themeText.navTitleChooseCinema)
    }
}
