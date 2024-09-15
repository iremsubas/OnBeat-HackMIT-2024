import SwiftUI

struct ContentView: View {
    @State private var isNavigating = false // Declare state variable for navigation

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150) // Adjust the size of the logo as needed
                .background(Color.black)
                .onAppear {
                    // Navigate after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isNavigating = true
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black) // Add background behind the entire view
        .navigationDestination(isPresented: $isNavigating) { // Navigate when isNavigating is true
            SecondView() // Navigate to SecondView
        }
        .navigationBarHidden(true)
    }
}


// Preview for the SwiftUI view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
