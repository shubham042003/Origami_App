import SwiftUI

struct CardView: View {
    var imageName: String
    var title: String
    var description: String
    var steps: [(imageName: String, description: String)] // Updated to include step images
    
    var body: some View {
        NavigationLink(destination: OrigamiDetailView(origamiName: title, steps: steps)) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.headline)
                        .padding(.top, 10)
                        .padding(.leading, 16)
                    
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.leading, 16)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Explore")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 90, height: 30)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.leading, 16)
                            .padding(.bottom, 10)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.trailing, 16)
            }
            .frame(width: UIScreen.main.bounds.width - 32, height: 150)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 3)
            .padding(.horizontal, 16)
        }
        .buttonStyle(PlainButtonStyle()) // Removes the default button style
    }
}
