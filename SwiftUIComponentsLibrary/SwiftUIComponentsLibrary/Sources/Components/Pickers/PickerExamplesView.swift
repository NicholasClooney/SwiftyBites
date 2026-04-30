import SwiftUI

struct PickerExamplesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ExampleSection(
                    title: "Plain Picker",
                    description: "Default picker presentation."
                ) {
                    CharacterPickerExample()
                }

                ExampleSection(
                    title: "Menu Picker",
                    description: "Uses the menu picker style."
                ) {
                    CharacterMenuPickerExample()
                }

                ExampleSection(
                    title: "Menu Pill",
                    description: "Menu picker wrapped in pill styling."
                ) {
                    CharacterPillPickerExample()
                }

                ExampleSection(
                    title: "Current Value Label",
                    description: "Custom label that shows the selected value."
                ) {
                    CharacterCurrentValuePickerExample()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
        }
        .navigationTitle("Picker Examples")
        .navigationBarTitleDisplayMode(.inline)
    }
}
