import Foundation
extension Date {
   public func convertDateToString(format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_EN_POSIX")
        
        return dateFormatter.string(from: self)
    }
}

