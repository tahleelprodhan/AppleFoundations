import SwiftUI

struct LikesView: View {
    @EnvironmentObject var viewModel: ProfessionViewModel
    @Binding var selectedTab: Tab

    var body: some View {
        ZStack {

            NavigationView {
                
                List {
                    
                    ForEach(viewModel.likes.reversed(), id: \ .self) { prof in
                        NavigationLink(destination: ProfessionDetailView(profession: prof)) {
                            Text(prof.title)
                        }
                    }
                }
                .navigationTitle("Likes")
                .navigationBarItems(leading: Button("Back") {
                    selectedTab = .main
                }, trailing: Button(action: { viewModel.resetLikes() }) {
                    Image(systemName: "trash")
                })
            }
        }
    }
}

//#Preview {
//    
//    @Binding var selectedTab: Tab = projectedValue.main
//    LikesView(selectedTab: $selectedTab).environmentObject(ProfessionViewModel())
//}
