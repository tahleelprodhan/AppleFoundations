import SwiftUI

struct BottomBar: View {
    @Binding var selected: Screen

    var body: some View {
        HStack {
            Spacer()
            Button { selected = .dislikes } label: {
                VStack { Image(systemName: "list.bullet"); Text("Dislikes").font(.caption) }
            }
            Spacer()
            Button { selected = .topResults } label: {
                VStack { Image(systemName: "star"); Text("Top Result").font(.caption) }
            }
            Spacer()
            Button { selected = .likes } label: {
                VStack { Image(systemName: "list.bullet"); Text("Likes").font(.caption) }
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
