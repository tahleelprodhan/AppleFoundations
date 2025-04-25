import SwiftUI

class ProfessionViewModel: ObservableObject {
    @Published var professions: [Profession] = []
    @Published var currentIndex: Int = 0
    @Published var likes: [Profession] = []
    @Published var dislikes: [Profession] = []
    @Published var didFinish: Bool = false

    private var history: [Action] = []

    enum Action {
        case liked(Profession)
        case disliked(Profession)
    }

    init() {
        loadProfessions()
    }

    var currentProfession: Profession? {
        guard professions.indices.contains(currentIndex) else { return nil }
        return professions[currentIndex]
    }

    var toGoCount: Int {
        professions.count - currentIndex
    }

    var likesCount: Int { likes.count }
    var dislikesCount: Int { dislikes.count }

    func like() {
        guard let prof = currentProfession else { return }
        likes.append(prof)
        history.append(.liked(prof))
        advance()
    }

    func dislike() {
        guard let prof = currentProfession else { return }
        dislikes.append(prof)
        history.append(.disliked(prof))
        advance()
    }

    func undo() {
        guard let last = history.popLast() else { return }
        switch last {
        case .liked(let prof):
            if let idx = likes.lastIndex(of: prof) {
                likes.remove(at: idx)
            }
        case .disliked(let prof):
            if let idx = dislikes.lastIndex(of: prof) {
                dislikes.remove(at: idx)
            }
        }
        currentIndex = max(currentIndex - 1, 0)
        didFinish = false
    }

    private func advance() {
        // Move to next index (this may go one past the end)
        currentIndex += 1

        // If they've processed all items, fire the finish flag
        if (likes.count + dislikes.count) >= professions.count {
            didFinish = true
        }
    }

    func resetLikes() {
        likes.removeAll()
        didFinish = false
    }

    func resetDislikes() {
        dislikes.removeAll()
        didFinish = false
    }

    func topResults() -> [Profession] {
        let grouped = Dictionary(grouping: likes, by: { $0 })
        let sorted = grouped.sorted { $0.value.count > $1.value.count }
        return sorted.prefix(3).map { $0.key }
    }

    // MARK: - CSV Loading

    private func loadProfessions() {
        guard let url = Bundle.main.url(forResource: "professions", withExtension: "csv") else {
            print("professions.csv not found in bundle")
            return
        }
        do {
            let content = try String(contentsOf: url)
            let lines = content.components(separatedBy: "\n")
            for (i, line) in lines.enumerated() {
                if i == 0 { continue }  // skip header
                let parts = line.components(separatedBy: ",")
                guard parts.count >= 5,
                      let idx = Int(parts[0]) else { continue }
                let prof = Profession(
                    index: idx,
                    title: parts[1],
                    description: parts[2],
                    imageName: parts[3],
                    extendedDescription: parts[4]
                )
                professions.append(prof)
            }
        } catch {
            print("Error loading CSV: \(error)")
        }
    }
}
