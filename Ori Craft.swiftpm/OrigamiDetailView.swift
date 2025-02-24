import SwiftUI

struct OrigamiDetailView: View {
    var origamiName: String
    var imageName: String 
    var steps: [(imageName: String, description: String)] // Now each step has an image
    @EnvironmentObject var tracker: LearningTracker

    @State private var isCompleted = false

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            
            Text(origamiName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading, 16)
            
            Text("Follow the steps below")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.leading, 16)
            
            Text("Total steps: \(steps.count)")
                .font(.headline)
                .foregroundColor(.blue)
                .padding(.leading, 16)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(steps.indices, id: \.self) { index in
                        StepCardView(
                            stepNumber: index + 1,
                            stepImage: steps[index].imageName,
                            stepDescription: steps[index].description
                        )
                    }
                }
                .padding(.top, 15)
            }
            
            Spacer()
            
            // Completion section
            VStack(spacing: 5) {
                Text("Click if completed tutorial")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Button(action: {
                    tracker.toggleCompletion(for: origamiName,imageName: imageName)
                }) {
                    Text(tracker.isCompleted(origamiName) ? "Completed!" : "Yes")
                        .font(.title3)
                        .padding(.vertical, 8) 
                        .frame(maxWidth: .infinity)
                        .background(tracker.isCompleted(origamiName) ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(false)
    }
}

struct StepCardView: View {
    var stepNumber: Int
    var stepImage: String
    var stepDescription: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Step number aligned left
            Text("Step \(stepNumber)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading, 16)
            
            // Card below step number with proper padding
            VStack {
                Image(stepImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                
                Text(stepDescription)
                    .font(.body)
                    .lineLimit(5)
                    .foregroundColor(.black)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 10)
    }
}
