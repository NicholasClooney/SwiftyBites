import SwiftUI

struct EqualWidthLayoutExample: View {
    var body: some View {
        EqualWidthHStack {
            Button("Short") {}
            Button("Much Longer Button") {}
            Button("Medium") {}
        }
        .buttonStyle(.borderedProminent)
    }
}
