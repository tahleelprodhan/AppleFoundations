import SwiftUI

//@main
//struct CareerSwipeApp: App {
//    @StateObject private var viewModel = ProfessionViewModel()
//
//    var body: some Scene {
//        WindowGroup {
//            RootView()
//                .environmentObject(viewModel)
//        }
//    }
//}

import SwiftUI

@main
struct CareerSwipeApp: App {
    @State private var showSplash = true
    @StateObject private var viewModel = ProfessionViewModel()

    var body: some Scene {
        WindowGroup {
            if showSplash {
            //SplashView(isActive: $showSplash)
            
            SplashScreen(isActive: $showSplash)
            } else {
                // ContentView()
                  //  .environmentObject(ProfessionViewModel())
                  //  .accentColor(Color("AccentColor"))
                RootView().environmentObject(viewModel)
            }
        }
    }
}
