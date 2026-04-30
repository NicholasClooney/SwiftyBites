import SwiftUI

struct ActionsMenuExample: View {
    @State private var lastAction = "No action selected"

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Menu("Actions") {
                Button("Duplicate", action: duplicate)
                Button("Rename", action: rename)
                Button("Delete...", role: .destructive, action: delete)

                Menu("Copy") {
                    Button("Copy", action: copy)
                    Button("Copy Formatted", action: copyFormatted)
                    Button("Copy Library Path", action: copyPath)
                }
            }
            .buttonStyle(.bordered)

            Text(lastAction)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    private func duplicate() {
        lastAction = "Duplicate selected"
    }

    private func rename() {
        lastAction = "Rename selected"
    }

    private func delete() {
        lastAction = "Delete selected"
    }

    private func copy() {
        lastAction = "Copy selected"
    }

    private func copyFormatted() {
        lastAction = "Copy Formatted selected"
    }

    private func copyPath() {
        lastAction = "Copy Library Path selected"
    }
}
