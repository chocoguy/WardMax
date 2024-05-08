import Foundation
struct ApiNetworkType : Codable {
	let id : Int?
	let name : String?
	let picture : String?
	let pictureRetina : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case picture = "picture"
		case pictureRetina = "pictureRetina"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		picture = try values.decodeIfPresent(String.self, forKey: .picture)
		pictureRetina = try values.decodeIfPresent(String.self, forKey: .pictureRetina)
	}

}
