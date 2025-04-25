import SwiftUI

@main
struct CareerSwipeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ProfessionViewModel())
        }
    }
}
