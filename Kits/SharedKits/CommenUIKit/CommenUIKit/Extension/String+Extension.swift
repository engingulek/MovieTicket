import Foundation

extension String {
    public func convertStringToDate(format:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_EN_POSIX")
        return dateFormatter.date(from: self)
    }
    
    
    public func format(mask:String) -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "*" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
               result.append(ch)
            }
        }
        return result
    }
    
    public func isValidEmail() -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: self)
        }
}
