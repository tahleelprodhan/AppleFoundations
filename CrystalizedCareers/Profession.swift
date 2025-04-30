import Foundation

struct Profession: Identifiable, Codable, Hashable {
    let id: UUID = UUID()
    let index: Int
    let title: String
    let description: String
    let imageName: String
    let extendedDescription: String
}
