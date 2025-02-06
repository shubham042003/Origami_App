// HomePageView.swift
import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    
    let origamiCards = [
        (imageName: "image1", title: "Boat", description: "A simple and classic paper boat, that can float.", steps: ["Step 1: Fold paper in half", "Step 2: Create a rectangle", "Step 3: Shape into a boat"]),
        (imageName: "image2", title: "Ninja Star", description: "A sharp star, perfect for playful target practice.", steps: ["Step 1: Fold paper in half", "Step 2: Fold the corners", "Step 3: Shape the wings"]),
        (imageName: "image3", title: "Frog", description: "A fun and interactive jumping frog.", steps: ["Step 1: Fold paper diagonally", "Step 2: Create the legs", "Step 3: Make the jumping fold"]),
        (imageName: "image4", title: "Crane", description: "A classic model representing peace and good fortune.", steps: ["Step 1: Fold paper in half", "Step 2: Create a triangle", "Step 3: Fold edges"]),
    ]
    
    var filteredCards: [(imageName: String, title: String, description: String, steps: [String])] {
        if searchText.isEmpty {
            return origamiCards
        } else {
            return origamiCards.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {

                // Title & Profile Icon
                HStack {
                    Text("Origami")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                .padding(.horizontal)
                
                // Search Bar
                TextField("Search Origami", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                // Subtitle
                Text("Learn paper craft")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                // Tutorials count
                Text("\(filteredCards.count) tutorials available")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                // Origami Cards
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(filteredCards, id: \.title) { card in
                            CardView(
                                imageName: card.imageName,
                                title: card.title,
                                description: card.description,
                                steps: card.steps
                            )
                        }
                    }
                    .padding(.top, 10) // Added space from the top
                    .padding(.bottom, 10)
                }
                
                Spacer()
            }
            .padding(.top, 30)
        }
        .navigationBarBackButtonHidden(true)
    }
}
