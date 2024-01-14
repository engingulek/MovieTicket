
import Foundation

public struct DataResult<T:Decodable> : Decodable {
    let message:String
    public var list:T
}


public typealias HallAndSessionResult<T:Decodable> = [String: T]
