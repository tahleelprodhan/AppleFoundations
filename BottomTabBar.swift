import SwiftUI

struct BottomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            Spacer()
            Button(action: { selectedTab = .dislikes }) {
                VStack {
                    Image(systemName: "list.bullet")
                        .foregroundStyle(Color("gold_color"))
                    Text("Dislikes")
                        .font(.caption)
                        .foregroundStyle(Color("gold_color"))
                }
            }
            Spacer()
            Button(action: { selectedTab = .top }) {
                VStack {
                    Image(systemName: "star")
                        .foregroundStyle(Color("gold_color"))
                    Text("Top Result")
                        .font(.caption)
                        .foregroundStyle(Color("gold_color"))
                }
            }
            Spacer()
            Button(action: { selectedTab = .likes }) {
                VStack {
                    Image(systemName: "list.bullet")
                        .foregroundStyle(Color("gold_color"))
                    Text("Likes")
                        .font(.caption)
                        .foregroundStyle(Color("gold_color"))
                }
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
