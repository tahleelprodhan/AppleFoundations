import SwiftUI

struct ProfessionCardView: View {
    let profession: Profession

    var body: some View {
        ZStack {
            Color("background_color").ignoresSafeArea()
            VStack {
                Image(profession.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .cornerRadius(10)
                Text(profession.title)
                    .font(.headline)
                    .padding(.top)
                Text(profession.description)
                    .font(.subheadline)
                    .padding(.horizontal)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color(UIColor.secondarySystemBackground)))
            .padding()
        }
    }
}
