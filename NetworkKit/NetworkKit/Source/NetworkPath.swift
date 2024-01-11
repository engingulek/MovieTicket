

import Foundation
import Alamofire
public enum NetworkPath {
    case genres
    case movieInCinema
    case futureMovie

    
}

extension NetworkPath : TargetType {
    var baseURL: String {
        return "https://movieticket-c36a3-default-rtdb.firebaseio.com/"
    }
    
    var path: String {
        switch self {
        case .movieInCinema:
            return "movieInCinema.json"
        case .futureMovie:
            return "futureMovie.json"
        case .genres:
            return "genres.json"

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
