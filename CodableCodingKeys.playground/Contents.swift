import UIKit

struct Some {
    let id: Int
    let name: String
}

enum SomeCodingKeys: CodingKey {
    case id
    case hoge
}

extension Some: Codable {
    init(from decoder: Decoder) throws {
        var container = try! decoder.container(keyedBy: SomeCodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .hoge)
    }
}

let decoder = JSONDecoder()
let encoder = JSONEncoder()

//let some = Some(id: 1, name: "Shunsee")
//let encodedSome = try! encoder.encode(some)

let someJsonString =
"""
{
  "id": 123,
  "hoge": "shunsuking"
}
"""

let decodedSome = try! decoder.decode(Some.self, from: someJsonString.data(using: .utf8)!)
print(decodedSome)

