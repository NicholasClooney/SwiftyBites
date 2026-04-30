import SwiftUI

struct CharacterCurrentValuePickerExample: View {
    @State private var selectedCharacter: CharacterOption = .all

    var body: some View {
        Picker(selection: $selectedCharacter) {
            ForEach(CharacterOption.allCases) { character in
                Text(character.rawValue).tag(character)
            }
        } label: {
            HStack(spacing: 6) {
                Text(selectedCharacter.rawValue)
                Image(systemName: "chevron.down")
                    .font(.caption)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.thinMaterial, in: Capsule())
        }
        .pickerStyle(.menu)
    }
}
