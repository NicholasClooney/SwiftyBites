import SwiftUI

struct MenuExamplesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ExampleSection(
                    title: "Filter Pills Bar",
                    description: "Horizontal menu pills for sort and category filters."
                ) {
                    FilterPillsBar()
                }

                ExampleSection(
                    title: "Nested Actions Menu",
                    description: "Menu with primary actions and a nested copy submenu."
                ) {
                    ActionsMenuExample()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
        }
        .navigationTitle("Menu Examples")
        .navigationBarTitleDisplayMode(.inline)
    }
}
