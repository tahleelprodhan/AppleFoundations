//
//  SplashScreen.swift
//  AppleFoundations4
//
//  Created by Macbook on 4/28/25.
//

import SwiftUI



struct SplashScreen: View {
    @Binding var isActive: Bool
    var body: some View {
        ZStack(alignment: .center) {
            Image("splash_logo").resizable().scaledToFill().ignoresSafeArea(edges: .all)
                .position(x: 173, y: 389)
            
        }
        .onAppear {
            // Dismiss after 1.5 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeOut(duration: 0.5)) {
                    isActive = false
                }
            }
        }
    }
    
}

//#Preview {
//    SplashScreen(isActive: $false)
//}
