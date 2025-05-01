import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ProfessionViewModel

    var body: some View {
        ZStack {
            Color("background_color").ignoresSafeArea()
            
            VStack {
                HStack {
                    CounterView(count: viewModel.dislikesCount, label: "Dislikes")                            .foregroundStyle(Color(.lightGray))
                    Spacer()
                    CounterView(count: viewModel.toGoCount, label: "To Go")                            .foregroundStyle(Color(.lightGray))
                    Spacer()
                    CounterView(count: viewModel.likesCount, label: "Likes")                            .foregroundStyle(Color(.lightGray))
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
                            VStack {
                                Image(systemName: "x.circle")
                                    .font(.largeTitle)
                                    .foregroundStyle(Color("gold_color"))
                                Text("Dislikes")
                                    .font(.caption)
                                    .foregroundStyle(Color("gold_color"))
                            }
                        }
                        Spacer()
                        Button(action: { viewModel.undo() }) {
                            VStack {
                                Image(systemName: "arrow.uturn.backward.circle")
                                    .font(.largeTitle)
                                    .foregroundStyle(Color("gold_color"))
                                Text("Undo")
                                    .font(.caption)
                                    .foregroundStyle(Color("gold_color"))
                            }
                        }
                        Spacer()
                        Button(action: { viewModel.like() }) {
                            VStack {
                                Image(systemName: "checkmark.circle")
                                    .font(.largeTitle)
                                    .foregroundStyle(Color("gold_color"))
                                Text("Likes")
                                    .font(.caption)
                                    .foregroundStyle(Color("gold_color"))
                            }
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
