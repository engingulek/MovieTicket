

import Foundation
import Alamofire
public enum NetworkPath {
    case genres
    case movieInCinema
    case futureMovie
    case hallsAndSessions(Int)
    case choosedHallAndSession
    case hoursAndSeats

    
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
        case .hallsAndSessions(let movieId):
            return "hallsAndSessions/list.json?orderBy=\"movieId\"&equalTo=\(movieId)"
        case .choosedHallAndSession:
            return "choosedHallAndSession.json"
        case .hoursAndSeats:
            return "hoursAndSeats.json"
            

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
