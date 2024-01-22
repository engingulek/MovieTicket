
import Foundation
@testable import HomeModule

class MockMovieInCV : MovieInCinemaCVInterface {
    var invokedrealoadData : Bool = false
    var invokedrealoadDataCount = 0
    func realoadData() {
         invokedrealoadData = true
         invokedrealoadDataCount += 1
        
    }
    
    var invokedstartAnimatigIndicator : Bool = false
    var invokedstartAnimatigIndicatorCount = 0
    func startAnimatigIndicator() {
        invokedstartAnimatigIndicator = true
        invokedstartAnimatigIndicatorCount += 1
    }
    
    var invokedstopAnimatingIndicator : Bool = false
    var invokedstopAnimatingIndicatorCount = 0
    func stopAnimatingIndicator() {
        invokedstopAnimatingIndicator = true
        invokedstopAnimatingIndicatorCount += 1
    }
    
    var invokedMessageWithLabel : Bool = false
    var invokedMessageWithLabelCount = 0
    var invokedMessageWithLabelParameters : (text:String,Void)?
    func messageWithLabel(text: String) {
         invokedMessageWithLabel = true
         invokedMessageWithLabelCount += 1
         invokedMessageWithLabelParameters = (text:text,())
    }
    
    
}
