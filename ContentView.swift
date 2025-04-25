import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ProfessionViewModel

    var body: some View {
        VStack {
            HStack {
                CounterView(count: viewModel.dislikesCount, label: "Dislikes")
                Spacer()
                CounterView(count: viewModel.toGoCount, label: "To Go")
                Spacer()
                CounterView(count: viewModel.likesCount, label: "Likes")
            }
            .padding()

            if let prof = viewModel.currentProfession {
                Spacer()
                ProfessionCardView(profession: prof)
                    .gesture(
                        DragGesture(minimumDistance: 50)
                            .onEnded {
                                if $0.translation.width < 0 {
                                    viewModel.dislike()
                                } else if $0.translation.width > 0 {
                                    viewModel.like()
                                }
                            }
                    )
                Spacer()
                HStack {
                    Button(action: { viewModel.dislike() }) {
                        Image(systemName: "x.circle")
                            .font(.largeTitle)
                    }
                    Spacer()
                    Button(action: { viewModel.undo() }) {
                        Image(systemName: "arrow.uturn.backward.circle")
                            .font(.largeTitle)
                    }
                    Spacer()
                    Button(action: { viewModel.like() }) {
                        Image(systemName: "checkmark.circle")
                            .font(.largeTitle)
                    }
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.16)
                .padding(.bottom)
            } else {
                Text("No more professions!")
                    .font(.title)
                    .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

struct CounterView: View {
    let count: Int
    let label: String

    var body: some View {
        VStack {
            Text("\(count)")
                .font(.title)
            Text(label)
                .font(.caption)
        }
    }
}
