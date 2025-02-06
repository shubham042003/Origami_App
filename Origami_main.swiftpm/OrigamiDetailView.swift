import SwiftUI

struct OrigamiDetailView: View {
    var origamiName: String
    var steps: [(imageName: String, description: String)] // Now each step has an image
    @EnvironmentObject var tracker: LearningTracker

    @State private var isCompleted = false

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            // Large title aligned left below back button
            Text(origamiName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading, 16)
            
            // Subtitle for steps
            Text("Follow the steps below")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.leading, 16)
            
            // Total steps count
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
            VStack {
                Text("Click if completed tutorial")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Button(action: {
                                tracker.toggleCompletion(for: origamiName)
                            }) {
                                Text(tracker.isCompleted(origamiName) ? "Completed!" : "Yes")
                                    .font(.title2)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(tracker.isCompleted(origamiName) ? Color.green : Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()
            }
            .padding(.bottom, 5)
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
                Image(stepImage) // Uses the step-specific image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                
                Text(stepDescription)
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding(.horizontal, 16) // Step card also starts from 16 on both sides
        }
        .padding(.bottom, 10)
    }
}
