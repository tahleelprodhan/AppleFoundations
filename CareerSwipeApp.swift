import SwiftUI

@main
struct CareerSwipeApp: App {
    @StateObject private var viewModel = ProfessionViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(viewModel)
        }
    }
}
