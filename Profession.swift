import Foundation

struct Profession: Identifiable, Codable, Hashable {
    let professionIndex: Int
    let title: String
    let description: String
    let imageName: String
    let extendedDescription: String

    var id: Int { professionIndex }
}
