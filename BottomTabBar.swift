import SwiftUI

struct BottomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            Spacer()
            Button(action: { selectedTab = .dislikes }) {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("Dislikes")
                        .font(.caption)
                }
            }
            Spacer()
            Button(action: { selectedTab = .top }) {
                VStack {
                    Image(systemName: "star")
                    Text("Top Result")
                        .font(.caption)
                }
            }
            Spacer()
            Button(action: { selectedTab = .likes }) {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("Likes")
                        .font(.caption)
                }
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
