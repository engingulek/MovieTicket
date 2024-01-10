

import Foundation
import Alamofire
public enum NetworkPath {
    case genres
    case movieInCinema
    case futureMovie

    
}

extension NetworkPath : TargetType {
    var baseURL: String {
        return "http://localhost:8080/api/"
    }
    
    var path: String {
        switch self {
        case .movieInCinema:
            return "movie/movieInCinema"
        case .futureMovie:
            return "movie/futureMovie"
        case .genres:
            return "genres/getGenres"

        }
    }
    
    var method: AlamofireMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var requestType: RequestType {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
