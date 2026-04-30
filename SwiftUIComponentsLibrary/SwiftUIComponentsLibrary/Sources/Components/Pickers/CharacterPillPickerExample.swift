import SwiftUI

struct CharacterPillPickerExample: View {
    @State private var selectedCharacter: CharacterOption = .all

    var body: some View {
        Picker("Character", selection: $selectedCharacter) {
            ForEach(CharacterOption.allCases) { character in
                Text(character.rawValue).tag(character)
            }
        }
        .pickerStyle(.menu)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.thinMaterial, in: Capsule())
    }
}
