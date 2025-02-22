import SwiftUI

struct Tab: View {
    @StateObject var tracker = LearningTracker()
    
    
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .environmentObject(tracker)
            
            TrackLearningView()
                .tabItem {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Track")
                }
                .environmentObject(tracker)
        }
        .navigationBarHidden(true) 
    }
}
