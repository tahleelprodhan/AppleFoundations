import SwiftUI

struct DislikesView: View {
    @EnvironmentObject var viewModel: ProfessionViewModel
    @Binding var selectedTab: Tab

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dislikes.reversed(), id: \ .self) { prof in
                    NavigationLink(destination: ProfessionDetailView(profession: prof)) {
                        Text(prof.title)
                    }
                }
            }
            .navigationTitle("Dislikes")
            .navigationBarItems(leading: Button("Back") {
                selectedTab = .main
            }, trailing: Button(action: { viewModel.resetDislikes() }) {
                Image(systemName: "trash")
            })
        }
    }
}
