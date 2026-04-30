import SwiftUI

struct FilterToken: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct SearchTokenResult: Identifiable {
    let id = UUID()
    let title: String
    let tokens: Set<String>
}

struct SearchTokensExample: View {
    @State private var query = ""
    @State private var selectedTokens: [FilterToken] = []
    @State private var suggested: [FilterToken] = [
        .init(name: "Unread"),
        .init(name: "Starred"),
        .init(name: "Today"),
    ]

    private let items = [
        SearchTokenResult(title: "Unread design review", tokens: ["Unread", "Today"]),
        SearchTokenResult(title: "Starred picker notes", tokens: ["Starred"]),
        SearchTokenResult(title: "Today release checklist", tokens: ["Today"]),
        SearchTokenResult(title: "Archived implementation notes", tokens: []),
    ]

    private var results: [SearchTokenResult] {
        items.filter { item in
            let matchesQuery = query.isEmpty || item.title.localizedCaseInsensitiveContains(query)
            let matchesTokens = selectedTokens.allSatisfy { item.tokens.contains($0.name) }
            return matchesQuery && matchesTokens
        }
    }

    var body: some View {
        List(results) { item in
            Text(item.title)
        }
        .navigationTitle("Search Tokens")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(
            text: $query,
            tokens: $selectedTokens,
            suggestedTokens: $suggested,
            prompt: "Search"
        ) { token in
            Label(token.name, systemImage: "tag")
        }
    }
}
