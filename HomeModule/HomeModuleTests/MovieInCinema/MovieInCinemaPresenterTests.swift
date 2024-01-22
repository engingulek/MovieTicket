import Foundation
import XCTest
import ModelKit
@testable import HomeModule

final class MovieInCinemaPresenterTests : XCTestCase {
    private var view : MockMovieInCV!
    private var interactor : MockHomeInteractor!
    private var presenter : MovieInCinemaPresenter!
    
    override func setUp() {
        view = .init()
        interactor = .init()
        presenter = .init(view: view, interactor: interactor)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    
    func test_WhenViewDidLoad_fetchMovieInCinema_ReturnData() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedMessageWithLabel)
        interactor.movieInCinemaShouldReturnError = false
        let moveiData = MovieResult.defaultData
        interactor.mockMovieResultData.append(moveiData)
        
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedMessageWithLabelCount, 1)
            XCTAssertEqual(self.view.invokedMessageWithLabelParameters?.text,"")
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_WhenViewDidLoad_fetchMovieInCinema_ReturnError() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedMessageWithLabel)
        interactor.movieInCinemaShouldReturnError = true
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedMessageWithLabelCount, 1)
            XCTAssertEqual(self.view.invokedMessageWithLabelParameters?.text,"Something went wrong")
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_WhenViewDidLoad_fetchMovieInCinema_ReturnEmptyData() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedMessageWithLabel)
        interactor.movieInCinemaShouldReturnError = false
        interactor.mockMovieResultData = []
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedMessageWithLabelCount, 1)
            XCTAssertEqual(self.view.invokedMessageWithLabelParameters?.text,"No Movie")
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_WhenViewDidLoad_fetchMovieInCinema_startAnimating(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedMessageWithLabel)
        interactor.movieInCinemaShouldReturnError = false
        interactor.mockMovieResultData = []
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedstartAnimatigIndicatorCount, 1)
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_WhenViewDidLoad_fetchMovieInCinema_IfSuccess_stopAnimating(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedMessageWithLabel)
        interactor.movieInCinemaShouldReturnError = true
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedstopAnimatingIndicatorCount, 1)
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func test_WhenViewDidLoad_fetchMovieInCinema_IfError_stopAnimating(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedMessageWithLabel)
        interactor.movieInCinemaShouldReturnError = true
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedstopAnimatingIndicatorCount, 1)
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_WhenViewDidLoad_fetchMovieInCinema_IfSuccess_reloadData(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedMessageWithLabel)
        interactor.movieInCinemaShouldReturnError = false
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedrealoadDataCount, 1)
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_WhenViewDidLoad_fetchMovieInCinema_IfError_reloadData(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedMessageWithLabel)
        interactor.movieInCinemaShouldReturnError = true
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           XCTAssertEqual(self.view.invokedrealoadDataCount, 1)
          
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
