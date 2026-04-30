import SwiftUI

private enum CardTypeOption: String, CaseIterable, Hashable {
    case attack
    case skill
    case power
    case status_effect = "status_effect"
}

private enum RarityOption: String, CaseIterable, Hashable {
    case common
    case uncommon
    case rare
    case boss_reward = "boss_reward"
}

struct EnumPickerExample: View {
    @State private var selectedCharacter: CharacterOption = .all
    @State private var selectedCardType: CardTypeOption = .attack
    @State private var selectedRarity: RarityOption = .common

    var body: some View {
        HStack {
            EnumPicker("Character", selection: $selectedCharacter)
            EnumPicker("Type", selection: $selectedCardType)
            EnumPicker("Rarity", selection: $selectedRarity)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.thinMaterial, in: Capsule())
    }
}
