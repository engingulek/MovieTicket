
import Foundation

public struct DataResult<T:Decodable> : Decodable {
    let message:String
    public var list:T
}


public typealias DictinoryResult<T:Decodable> = [String: T]

public struct AddDataResult: Codable {
    let name: String
}
