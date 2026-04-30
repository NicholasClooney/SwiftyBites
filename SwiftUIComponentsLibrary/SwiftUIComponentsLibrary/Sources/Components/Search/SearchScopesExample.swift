import SwiftUI

enum SearchScope: String, CaseIterable, Identifiable {
    case all
    case active
    case archived

    var id: Self { self }
    var label: String { rawValue.capitalized }
}

struct ScopedListItem: Identifiable {
    let id = UUID()
    let name: String
    let scope: SearchScope
}

struct SearchScopesExample: View {
    @State private var query = ""
    @State private var scope: SearchScope = .all

    private let items = [
        ScopedListItem(name: "Inbox cleanup", scope: .active),
        ScopedListItem(name: "Draft release notes", scope: .active),
        ScopedListItem(name: "Archived invoice flow", scope: .archived),
        ScopedListItem(name: "Archived onboarding pass", scope: .archived),
        ScopedListItem(name: "Component audit", scope: .active),
    ]

    private var filtered: [ScopedListItem] {
        items.filter { item in
            let matchesScope = scope == .all || item.scope == scope
            let matchesQuery = query.isEmpty || item.name.localizedCaseInsensitiveContains(query)
            return matchesScope && matchesQuery
        }
    }

    var body: some View {
        List(filtered) { item in
            Text(item.name)
        }
        .navigationTitle("Search Scopes")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $query)
        .searchScopes($scope, activation: .onSearchPresentation) {
            ForEach(SearchScope.allCases) { scope in
                Text(scope.label).tag(scope)
            }
        }
    }
}
