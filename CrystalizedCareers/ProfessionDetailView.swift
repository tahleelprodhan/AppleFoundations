import SwiftUI

struct ProfessionDetailView: View {
    let profession: Profession

    var body: some View {
        ZStack {
            //Color("background_color").ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    Image(profession.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                    Text(profession.title)
                        .font(.title)
                        .padding(.top)
                    Text(profession.description)
                        .padding(.vertical)
                    Text("You will learn:")
                        .font(.headline)
                        .padding(.top)
                    Text(profession.extendedDescription)
                        .padding(.bottom)
                }
                .padding()
            }
            .navigationTitle("Learn More")
        }
    }
}
