// OrigamiDetailView.swift
import SwiftUI

struct OrigamiDetailView: View {
    var origamiName: String
    var steps: [String] // Array of steps for the origami
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                
                // Subtitle for steps
                Text("Follow the steps below")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.leading, 16)
                
                // ScrollView for steps
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(steps, id: \.self) { step in
                            StepCardView(stepDescription: step)
                        }
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(false) // Ensure back button is visible
            .navigationBarItems(leading: Text(origamiName).font(.title2).fontWeight(.bold)) // Set origami name as title
        }
    }
}

struct StepCardView: View {
    var stepDescription: String
    
    var body: some View {
        VStack {
            Text(stepDescription)
                .font(.body)
                .foregroundColor(.black)
                .padding()
            
            Divider()
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        .padding(.horizontal, 16)
    }
}
