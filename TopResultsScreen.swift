import SwiftUI

struct TopResultsScreen: View {
    @EnvironmentObject var vm: ProfessionViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Top Results").font(.headline)
                Spacer()
                Button { vm.shareTopResults() } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            .padding()

            Text("🎉 Congrats on finding your career! 🎉\n\nBelow are your top 3 career choices based on your swipes. You can tap each to learn more about them. You can also email your results to family and friends.")
                .padding([.horizontal, .bottom])

            List(vm.top3) { p in
                Button(p.title) {
                    vm.selectedProfession = p
                    vm.showingLearnMore = true
                }
            }

            Spacer()

            Button("Email your results") {
                vm.shareTopResults()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(UIColor.systemGray5))
            .cornerRadius(8)
            .padding()
        }
    }
}
