import SwiftUI

struct LearnMoreView: View {
    let profession: Profession

    var body: some View {
        VStack {
            Image(profession.imageName)
                .resizable()
                .scaledToFit()
            Text(profession.title).font(.title).padding(.top)
            Text(profession.description).padding(.horizontal)
            Divider().padding()
            Text("You will learn:").font(.headline).padding(.bottom, 4)
            Text(profession.extendedDescription)
                .padding(.horizontal)
            Spacer()
        }
        .padding()
    }
}
