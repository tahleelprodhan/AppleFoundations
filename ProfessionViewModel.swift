import SwiftUI
import Combine

class ProfessionViewModel: ObservableObject {
    @Published var professions: [Profession] = []
    @Published var currentIndex: Int = 0
    @Published var likes: [Profession] = []
    @Published var dislikes: [Profession] = []
    @Published var selectedProfession: Profession?
    @Published var showingLearnMore = false
    @Published var showingShare = false

    init() {
        loadCSV()
    }

    var currentProfession: Profession? {
        guard currentIndex < professions.count else { return nil }
        return professions[currentIndex]
    }

    var toGoCount: Int { professions.count - currentIndex }
    var top3: [Profession] {
        let counts = Dictionary(grouping: likes, by: { $0 })
            .mapValues(\.count)
        return counts
            .sorted { $0.value > $1.value }
            .prefix(3)
            .map(\.key)
    }

    func like() {
        guard let prof = currentProfession else { return }
        likes.append(prof)
        undoStack.append((prof, .like))
        advance()
    }

    func dislike() {
        guard let prof = currentProfession else { return }
        dislikes.append(prof)
        undoStack.append((prof, .dislike))
        advance()
    }

    func undo() {
        guard let (prof, action) = undoStack.popLast() else { return }
        switch action {
        case .like:
            likes.removeLast()
        case .dislike:
            dislikes.removeLast()
        }
        currentIndex = max(currentIndex - 1, 0)
    }

    func resetLikes() {
        likes.removeAll()
    }

    func resetDislikes() {
        dislikes.removeAll()
    }

    func shareTopResults() {
        showingShare = true
    }

    var topResultsEmailBody: String {
        var body = "Just wanted to share my top 3 favorite professions.\n\n"
        for p in top3 {
            body += "\(p.title)\n"
        }
        return body
    }

    // MARK: - Private

    private enum Action { case like, dislike }
    private var undoStack: [(Profession, Action)] = []

    private func advance() {
        currentIndex += 1
    }

    private func loadCSV() {
        guard let url = Bundle.main.url(forResource: "professions", withExtension: "csv"),
              let data = try? Data(contentsOf: url),
              let str = String(data: data, encoding: .utf8) else { return }

        let lines = str.components(separatedBy: "\n").filter { !$0.isEmpty }
        professions = lines.compactMap { line in
            let parts = line.components(separatedBy: ",")
            guard parts.count == 5,
                  let idx = Int(parts[0]) else { return nil }
            return Profession(
                professionIndex: idx,
                title: parts[1],
                description: parts[2],
                imageName: parts[3],
                extendedDescription: parts[4]
            )
        }
    }
}
