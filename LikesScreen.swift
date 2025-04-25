import SwiftUI

struct LikesScreen: View {
    @EnvironmentObject var vm: ProfessionViewModel
    @Binding var selected: Screen

    var body: some View {
        VStack {
            HStack {
                Button { selected = .landing } label: {
                    Image(systemName: "chevron.left"); Text("Back")
                }
                Spacer()
                Text("Likes").font(.headline)
                Spacer()
                Button { vm.resetLikes() } label: {
                    Image(systemName: "trash")
                }
            }
            .padding()

            List(vm.likes.reversed()) { p in
                Button(p.title) {
                    vm.selectedProfession = p
                    vm.showingLearnMore = true
                }
            }
        }
    }
}
