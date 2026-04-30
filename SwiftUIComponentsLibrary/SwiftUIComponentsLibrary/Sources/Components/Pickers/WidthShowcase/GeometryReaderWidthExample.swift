import SwiftUI

struct GeometryReaderWidthExample: View {
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width * 0.3

            HStack {
                Button("Short") {}
                    .frame(width: width)

                Button("Longer Button") {}
                    .frame(width: width)
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
        }
        .frame(height: 88)
    }
}
