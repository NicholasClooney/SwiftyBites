import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Picker Components")
                    .font(.largeTitle.bold())

                Text("Run the app to compare the plain picker, menu picker, pill styling, and a custom label that reflects the current selection.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
