

import Foundation
import Alamofire
public enum NetworkPath {
    case movieInCinema
    case futureMovie
    case hallsAndSessions(Int)
    case choosedHallAndSession
    case hoursAndSeats
    case createTicket(Parameters)
}

extension NetworkPath : TargetType {
    var baseURL: String {
        return Constants.constansts.baseUrl
    }
    
    var path: String {
        switch self {
        case .movieInCinema:
            return Constants.constansts.movieInCinema
        case .futureMovie:
            return Constants.constansts.futureMovie
        case .hallsAndSessions(let movieId):
            return "hallsAndSessions/list.json?orderBy=\"movieId\"&equalTo=\(movieId)"
        case .choosedHallAndSession:
            return Constants.constansts.choosedHallAndSession
        case .hoursAndSeats:
            return Constants.constansts.hoursAndSeats
        case .createTicket:
            return Constants.constansts.createTicket
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        case .createTicket:
            return .POST
        default:
            return .GET
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .createTicket(let ticket):
            return .requestParameters(parameters: ticket, encoding: JSONEncoding.init())
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
