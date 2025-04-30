import SwiftUI
import MessageUI

struct TopResultsView: View {
    @EnvironmentObject var viewModel: ProfessionViewModel
    @Binding var selectedTab: Tab
    @State private var showingMail = false

    var body: some View {
        ZStack {

            NavigationView {
                //Color("background_color").ignoresSafeArea()
                VStack {
                    Text("🎉 Congrats on finding your career! 🎉")
                        .font(.headline)
                        .padding()
                    Text("Below are your top 3 career choices based on your swipes. You can tap each to learn more about them. You can also email your results to family and friends.")
                        .font(.subheadline)
                        .padding(.horizontal)
                    
                    List {
                        ForEach(viewModel.topResults(), id: \ .self) { prof in
                            NavigationLink(destination: ProfessionDetailView(profession: prof)) {
                                Text(prof.title)
                            }
                        }
                    }
                    
//                    Button("Email your results") {
//                        showingMail = true
//                    }
                    Button("Email your results") {
                      if MFMailComposeViewController.canSendMail() {
                        showingMail = true
                      } else {
                        // fallback, e.g. show an Alert
                        print("Mail services are not available.")
                      }
                    }
                    .padding()
                    .sheet(isPresented: $showingMail) {
                        MailView(subject: "My favorite professions",
                                 body: composeBody(),
                                 isPresented: $showingMail)
                    }
                }
                .navigationTitle("Top Results")
                .navigationBarItems(leading: Button("Back") {
                    selectedTab = .main
                }, trailing: Button(action: { showingMail = true }) {
                    Image(systemName: "square.and.arrow.up")
                })
            }.background(Color("background_color"))
        }
    }

    private func composeBody() -> String {
        let items = viewModel.topResults().map { "- \($0.title)" }.joined(separator: "\n")
        return "Just wanted to share my top 3 favorite professions.\n\n\(items)"
    }
}
