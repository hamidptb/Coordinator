import SwiftUI

struct SampleSwiftUIView: View {
    var body: some View {
        VStack {
            Text("SwiftUI View")
                .font(.largeTitle)
            Text("Integrated with UIKit using Coordinator pattern")
                .font(.subheadline)
        }
        .navigationTitle("SwiftUI Sample")
    }
} 