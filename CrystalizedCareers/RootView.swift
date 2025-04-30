import SwiftUI

enum Tab {
    case main, dislikes, top, likes
}

struct RootView: View {
    @EnvironmentObject var viewModel: ProfessionViewModel
    @State private var selectedTab: Tab = .main

    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case .main:
                ContentView()
            case .dislikes:
                DislikesView(selectedTab: $selectedTab)
            case .top:
                TopResultsView(selectedTab: $selectedTab)
            case .likes:
                LikesView(selectedTab: $selectedTab)
            }
            Divider()
            BottomTabBar(selectedTab: $selectedTab)
        }
        // ← Listen to the real publisher
        .onReceive(viewModel.$didFinish) { finished in
            if finished {
                selectedTab = .top
            }
        }
    }
}
