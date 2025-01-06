import SwiftUI

struct HybridSwiftUIView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("SwiftUI Component")
                .font(.title)
            
            Image(systemName: "swift")
                .font(.system(size: 50))
            
            Text("Embedded in UIKit")
                .font(.subheadline)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
} 