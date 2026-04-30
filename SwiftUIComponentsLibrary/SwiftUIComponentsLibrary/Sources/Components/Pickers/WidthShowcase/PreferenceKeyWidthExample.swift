import SwiftUI

private struct MaxWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct PreferenceKeyWidthExample: View {
    @State private var maxWidth: CGFloat = 0

    var body: some View {
        HStack {
            widthSyncedButton("Short")
            widthSyncedButton("Much Longer Button")
            widthSyncedButton("Medium")
        }
        .buttonStyle(.borderedProminent)
        .onPreferenceChange(MaxWidthKey.self) { maxWidth = $0 }
    }

    private func widthSyncedButton(_ title: String) -> some View {
        Button(title) {}
            .frame(width: maxWidth == 0 ? nil : maxWidth)
            .background(
                GeometryReader { proxy in
                    Color.clear.preference(
                        key: MaxWidthKey.self,
                        value: proxy.size.width
                    )
                }
            )
    }
}
