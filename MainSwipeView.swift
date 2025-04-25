import SwiftUI

struct MainSwipeView: View {
    @EnvironmentObject var vm: ProfessionViewModel

    var body: some View {
        VStack {
            HStack {
                CounterView(count: vm.dislikes.count, label: "Dislikes")
                Spacer()
                CounterView(count: vm.toGoCount, label: "To Go")
                Spacer()
                CounterView(count: vm.likes.count, label: "Likes")
            }
            .padding()

            Spacer()

            if let prof = vm.currentProfession {
                VStack {
                    Image(prof.imageName)
                        .resizable()
                        .scaledToFit()
                        .gesture(swipeGesture)
                    Text(prof.title).font(.title).padding(.top)
                    Text(prof.description).padding()
                    HStack {
                        Button(action: vm.dislike) {
                            Image(systemName: "x.circle").font(.largeTitle)
                        }
                        Spacer()
                        Button(action: vm.undo) {
                            Image(systemName: "arrow.uturn.backward.circle").font(.largeTitle)
                        }
                        Spacer()
                        Button(action: vm.like) {
                            Image(systemName: "checkmark.circle").font(.largeTitle)
                        }
                    }
                    .padding()
                }
            } else {
                Text("No more professions to review.")
            }

            Spacer()
        }
    }

    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 50)
            .onEnded { g in
                if g.translation.width < 0 { vm.dislike() }
                else if g.translation.width > 0 { vm.like() }
            }
    }
}

struct CounterView: View {
    let count: Int
    let label: String

    var body: some View {
        VStack {
            Text("\(count)").font(.headline)
            Text(label).font(.caption)
        }
    }
}
