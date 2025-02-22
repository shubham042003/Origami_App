import SwiftUI

class LearningTracker: ObservableObject {
    @Published var completedTutorials: [(name: String, date: Date, imageName: String)] = []
    
    func toggleCompletion(for tutorial: String, imageName: String) {
        if let index = completedTutorials.firstIndex(where: { $0.name == tutorial }) {
            completedTutorials.remove(at: index) 
        } else {
            completedTutorials.append((name: tutorial, date: Date(), imageName: imageName))
        }
    }
    
    func isCompleted(_ tutorial: String) -> Bool {
        return completedTutorials.contains { $0.name == tutorial }
    }
}

// View for tracking completed tutorials
struct TrackLearningView: View {
    @EnvironmentObject var tracker: LearningTracker
    private let dateFormatter: DateFormatter
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
    }

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
                    ForEach(tracker.completedTutorials, id: \.name) { tutorial in
                        HStack {
                            Image(tutorial.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading) {
                                Text(tutorial.name)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(dateFormatter.string(from: tutorial.date))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation {
                                    tracker.toggleCompletion(for: tutorial.name, imageName: tutorial.imageName)
                                }
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle()) 
                    }
                        .padding(.vertical, 5)
                    }
                }
            }
        }
    }
}
