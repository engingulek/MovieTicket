
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
    
   public static let defaultData  =  MovieResult(
    cast: [
        .init(
        id: -1,
        imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Johnny_Depp_2020.jpg/240px-Johnny_Depp_2020.jpg",
        name: "Jack Sparrow",
        role: "Johnny Depp"),
        .init(id: -2,
             imageURL: "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/68693_v9_bb.jpg",
             name: "Geoffrey Rush",
            role: "Barbossa"),
        .init(
            id: -3,
            imageURL: "https://img03.imgsinemalar.com/images/afis_buyuk/k/keira-knightley-1693821353.jpg",
            name: "Keira Knightley",
            role: "Elizabeth Swann")
    
    ],
    detailImageURL: "https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/C6AB0EDCE8F41882EBBB782B76DD4F05D7E360D7C3F23B4F6D02C24699B26105/scale?width=1200&aspectRatio=1.78&format=jpeg",
    director: "Gore Verbinski",
    genres: ["Action","Adventure","Fantasy"],
    id: 0,
    imageURL: "https://tr.web.img4.acsta.net/medias/nmedia/18/84/05/33/19771364.jpg",
    movieInfo: "Blacksmith Will Turner teams up with eccentric pirate 'Captain' Jack Sparrow to save his love, the governor's daughter, from Jack's former pirate allies, who are now undead",
    name: "Pirates of the Caribbean: The Curse of the Black Pearl",
    runtime: 183,
    year: "2003")
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

