import SwiftUI

enum SortOption: String, CaseIterable {
    case newest
    case oldest
    case alphabetical

    var label: String {
        switch self {
        case .newest:
            "Newest"
        case .oldest:
            "Oldest"
        case .alphabetical:
            "A-Z"
        }
    }
}

enum Category: String, CaseIterable {
    case all
    case design
    case development
    case research

    var label: String {
        switch self {
        case .all:
            "All"
        case .design:
            "Design"
        case .development:
            "Development"
        case .research:
            "Research"
        }
    }
}

struct FilterPillsBar: View {
    @State private var sort: SortOption = .newest
    @State private var category: Category = .all

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                Menu {
                    Picker("Sort", selection: $sort) {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Text(option.label).tag(option)
                        }
                    }
                } label: {
                    PillLabel(title: "Sort", value: sort.label)
                }

                Menu {
                    Picker("Category", selection: $category) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Text(category.label).tag(category)
                        }
                    }
                } label: {
                    PillLabel(title: "Category", value: category.label)
                }
            }
            .padding(.horizontal)
        }
        .modifier(ScrollClipDisabledIfAvailable())
    }
}

struct PillLabel: View {
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 4) {
            Text("\(title): \(value)")
                .font(.subheadline.weight(.medium))
            Image(systemName: "chevron.down")
                .font(.caption2.weight(.semibold))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(.regularMaterial, in: .capsule)
        .overlay(Capsule().stroke(.separator))
    }
}

private struct ScrollClipDisabledIfAvailable: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content.scrollClipDisabled()
        } else {
            content
        }
    }
}
