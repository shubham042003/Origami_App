import SwiftUI

struct Tab: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            TrackLearningView()
                .tabItem {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Track")
                }
        }
        .navigationBarHidden(true) 
    }
}
