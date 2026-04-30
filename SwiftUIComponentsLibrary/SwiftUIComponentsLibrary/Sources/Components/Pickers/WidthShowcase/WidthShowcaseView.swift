import SwiftUI

struct WidthShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ExampleSection(
                    title: "Equal Width Layout",
                    description: "Custom Layout that makes sibling views match the widest child."
                ) {
                    showcaseScrollView {
                        EqualWidthLayoutExample()
                    }
                }

                ExampleSection(
                    title: "Geometry Reader Width",
                    description: "Container-driven widths derived from parent space rather than child content."
                ) {
                    showcaseScrollView {
                        GeometryReaderWidthExample()
                    }
                }

                ExampleSection(
                    title: "Preference Key Width",
                    description: "Classic measure-upward and re-apply pattern for content-driven width syncing."
                ) {
                    showcaseScrollView {
                        PreferenceKeyWidthExample()
                    }
                }

                ExampleSection(
                    title: "Generic Enum Picker",
                    description: "Reusable menu picker that measures its enum labels and keeps a stable width."
                ) {
                    showcaseScrollView {
                        EnumPickerExample()
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
        }
        .navigationTitle("Width Showcase")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func showcaseScrollView<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            content()
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
