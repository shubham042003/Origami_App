// HomePageView.swift
import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    
    
    let origamiCards = [
        (imageName: "image1", title: "Boat", description: "A simple and classic paper boat, that can float.",
         steps: [("Boat1", "Fold the paper in half."),
                 ("Boat2", "Fold in half again."),
                 ("Boat3", "Fold in corners."),
                 ("Boat4", "Fold up edges on both sides."),
                 ("Boat5", "Pull the sides out and flatten."),
                 ("Boat6", "Fold front and back layers up."),
                 ("Boat7", "Pull the sides apart and flatten."),
                 ("Boat8", "Pull top flaps outwards."),
                 ("Boat9", "Squish the bottom and pull the sides up."),
                 ("Boat10", "Hurray! The boat is ready.")]),

        
        (imageName: "image2", title: "Ninja Star", description: "A sharp star, perfect for playful target practice.",
         steps: [("Star1", "You will need 2 pieces of square paper."),
                 ("Star2", "Fold the top of the paper down on both sections. Then do it again."),
                 ("Star3", "Fold both of them in half horizontally, and unfold."),
                 ("Star4", "For the left piece, fold the left side up, aligning it with the fold you made in the previous step. For the right piece, fold the left side down."),
                 ("Star5", "Follow the photos."),
                 ("Star6", "Flip them over."),
                 ("Star7", "Fold the corners like so."),
                 ("Star8", "Orient the papers like in the photos."),
                 ("Star9", "Tuck in the uppermost flap into the one on the right."),
                 ("Star10", "Tuck the bottom flap into the left one."),
                 ("Star11", "Flip over."),
                 ("Star12", "Tuck in the right flap into the space between the upper and lower flaps. Then do the same with the left flap."),
                 ("Star13", "You are done!")]),
        

        (imageName: "image3", title: "Frog", description: "A fun and interactive jumping frog.",
         steps: [("image3", "Step 1: Fold paper diagonally"),
                 ("image3", "Step 2: Create the legs"),
                 ("image3", "Step 3: Make the jumping fold")]),
        

        (imageName: "image4", title: "Crane", description: "A classic model representing peace and good fortune.",
         steps: [("image4", "Step 1: Fold paper in half"),
                 ("image4", "Step 2: Create a triangle"),
                 ("image4", "Step 3: Fold edges")])
    ]

    
    var filteredCards: [(imageName: String, title: String, description: String, steps: [(imageName: String, description: String)])] {
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
                                NavigationLink(destination: OrigamiDetailView(
                                    origamiName: card.title,
                                    steps: card.steps
                                )) {
                                    CardView(
                                        imageName: card.imageName,
                                        title: card.title,
                                        description: card.description,
                                        steps: card.steps
                                    )
                                }
                                .buttonStyle(PlainButtonStyle()) // Removes default button styling
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
