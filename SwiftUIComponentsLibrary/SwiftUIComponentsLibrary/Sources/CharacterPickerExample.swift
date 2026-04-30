import SwiftUI

struct CharacterPickerExample: View {
    @State private var selectedCharacter: CharacterOption = .all

    var body: some View {
        Picker("Character", selection: $selectedCharacter) {
            ForEach(CharacterOption.allCases) { character in
                Text(character.rawValue).tag(character)
            }
        }
    }
}
