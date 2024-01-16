import Foundation
import UIKit

extension String {
    func format(mask:MaskFormat) -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask.rawValue where index < numbers.endIndex {
            if ch == "*" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
               result.append(ch)
            }
        }
        return result
    }
    
    func isValidEmail() -> Bool {
            // Basit bir e-posta adresi doğrulama kontrolü
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: self)
        }

}
