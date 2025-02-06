import SwiftUI

class LearningTracker: ObservableObject {
    @Published var completedTutorials: [String] = []
    
    func toggleCompletion(for tutorial: String) {
        if completedTutorials.contains(tutorial) {
            completedTutorials.removeAll { $0 == tutorial } // Remove if already completed
        } else {
            completedTutorials.append(tutorial) // Add if not completed
        }
    }
    
    func isCompleted(_ tutorial: String) -> Bool {
        return completedTutorials.contains(tutorial)
    }
}

struct TrackLearningView: View {
    @EnvironmentObject var tracker: LearningTracker

    var body: some View {
        VStack {
            Text("Completed Tutorials")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            if tracker.completedTutorials.isEmpty {
                Text("No tutorials completed yet!")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(tracker.completedTutorials, id: \.self) { tutorial in
                        HStack {
                            Text(tutorial)
                                .font(.title2)
                            
                            Spacer()
                            
                            Button(action: {
                                tracker.toggleCompletion(for: tutorial)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
        }
    }
}
