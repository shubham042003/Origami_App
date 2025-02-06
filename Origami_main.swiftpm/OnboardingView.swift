// MARK: - Onboarding Screen
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            Image("image1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            Image("image2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            Image("image3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            Image("image4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        .padding(.horizontal)
                    }

                    Text("Welcome to Origami Tutorials! Learn different paper craft arts with easy steps.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)

                    NavigationLink(destination: Tab()) {
                        Text("Continue")
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.top, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding()
            }
        }
        .navigationBarHidden(true) // Hide back button
    }
}
