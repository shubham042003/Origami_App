import SwiftUI

struct OrigamiDetailView: View {
    var origamiName: String
    var steps: [String] // Array of steps for the origami

    @State private var isCompleted = false // Track button state

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            // Large title aligned to the left below the back button
            Text(origamiName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading, 16)
            
            // Subtitle for steps
            Text("Follow the steps below")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.leading, 16)
            
            // Total number of steps
            Text("Total steps: \(steps.count)")
                .font(.headline)
                .foregroundColor(.blue)
                .padding(.leading, 16)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(steps.indices, id: \.self) { index in
                        StepCardView(stepNumber: index + 1, stepDescription: steps[index])
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
                    isCompleted.toggle()
                }) {
                    Text(isCompleted ? "Completed!" : "Yes")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isCompleted ? Color.green : Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
            }
        }

        .navigationBarBackButtonHidden(false) // Ensure back button is visible
    }
}

struct StepCardView: View {
    var stepNumber: Int
    var stepDescription: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // Step number aligned left
            Text("Step \(stepNumber)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading, 16)
            
            // Card below step number with proper padding
            VStack {
                Image("step\(stepNumber)") // Ensure images are named as "step1", "step2", etc.
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(10)
                
                Text(stepDescription)
                    .font(.body)
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
