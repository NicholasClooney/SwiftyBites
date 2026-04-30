import SwiftUI

enum CharacterOption: String, CaseIterable, Identifiable {
    case all = "All"
    case defect = "Defect"
    case ironclad = "Ironclad"
    case silent = "Silent"

    var id: String { rawValue }
}
