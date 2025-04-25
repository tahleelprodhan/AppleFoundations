import SwiftUI

enum Screen { case landing, dislikes, topResults, likes }

struct ContentView: View {
    @EnvironmentObject var vm: ProfessionViewModel
    @State private var selected: Screen = .landing

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selected {
                case .landing:
                    MainSwipeView()
                case .dislikes:
                    DislikesScreen(selected: $selected)
                case .topResults:
                    TopResultsScreen()
                case .likes:
                    LikesScreen(selected: $selected)
                }
            }
            .animation(.default, value: selected)
            Divider()
            BottomBar(selected: $selected)
        }
        .sheet(isPresented: $vm.showingLearnMore) {
            if let prof = vm.selectedProfession {
                LearnMoreView(profession: prof)
            }
        }
        .sheet(isPresented: $vm.showingShare) {
            ActivityView(activityItems: [vm.topResultsEmailBody])
        }
    }
}
