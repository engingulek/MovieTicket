
import Foundation

struct Movie : Decodable {
    var id:Int = 0
    let imageUrl:String?
    let name:String?
    let genres:[String]?
}

