// TrackView.swift
import SwiftUI

struct TrackLearningView: View {
    @State private var completedTutorials: [String] = ["Paper Crane", "Origami Butterfly"]
    
    var body: some View {
        VStack {
            Text("Completed Tutorials")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            List(completedTutorials, id: \.self) { tutorial in
                Text(tutorial)
                    .font(.title2)
            }
        }
    }
}
