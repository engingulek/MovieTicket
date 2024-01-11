
import Foundation

// MARK: - MovieResult
public struct MovieResult: Decodable {
    public let cast: [Cast]
    public  let detailImageURL: String
    public let director: String
    public let genres: [String]
    public let id: Int
    public let imageURL: String
    public let movieInfo, name: String
    public let runtime: Int
    public  let year: String

    public  enum CodingKeys: String, CodingKey {
        case cast
      case detailImageURL = "detailImageUrl"
        case director, genres, id
         case imageURL = "imageUrl"
         case movieInfo, name, runtime, year
    }
    
   public static let defaultData  =  MovieResult(cast: [.init(id: 0, imageURL: "", name: "", role: "")], detailImageURL: "", director: "", genres: [""], id: 0, imageURL: "", movieInfo: "", name: "", runtime: 0, year: "")
}

// MARK: - Cast
public struct Cast: Decodable {
    public let id: Int
    public let imageURL: String
    public let name, role: String

    public enum CodingKeys: String, CodingKey {
       case id
        case imageURL = "imageUrl"
      case name, role
    }
}

