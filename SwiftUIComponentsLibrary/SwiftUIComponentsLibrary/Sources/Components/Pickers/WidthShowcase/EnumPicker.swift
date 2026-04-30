import SwiftUI

private struct MaxLabelWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct EnumPicker<Value>: View
where Value: CaseIterable & Hashable & RawRepresentable, Value.RawValue == String {
    let text: String
    @Binding var selection: Value

    @State private var maxLabelWidth: CGFloat = 0

    init(_ text: String, selection: Binding<Value>) {
        self.text = text
        _selection = selection
    }

    var body: some View {
        Picker(text, selection: $selection) {
            ForEach(Array(Value.allCases), id: \.self) { value in
                Text(value.pickerDisplayText)
                    .tag(value)
            }
        }
        .pickerStyle(.menu)
        .frame(
            width: maxLabelWidth == 0 ? nil : maxLabelWidth + 28,
            alignment: .leading
        )
        .background(widthMeasurer)
        .onPreferenceChange(MaxLabelWidthKey.self) { maxLabelWidth = $0 }
    }

    private var widthMeasurer: some View {
        HStack(spacing: 0) {
            ForEach(Array(Value.allCases), id: \.self) { value in
                Text(value.pickerDisplayText)
                    .fixedSize()
                    .background(
                        GeometryReader { proxy in
                            Color.clear.preference(
                                key: MaxLabelWidthKey.self,
                                value: proxy.size.width
                            )
                        }
                    )
                    .hidden()
            }

            Text(text)
                .fixedSize()
                .background(
                    GeometryReader { proxy in
                        Color.clear.preference(
                            key: MaxLabelWidthKey.self,
                            value: proxy.size.width
                        )
                    }
                )
                .hidden()
        }
        .hidden()
    }
}

private extension RawRepresentable where RawValue == String {
    var pickerDisplayText: String {
        rawValue
            .replacingOccurrences(of: "_", with: " ")
            .localizedCapitalized
    }
}
