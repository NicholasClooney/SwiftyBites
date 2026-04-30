import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section("Pickers and Menus") {
                    NavigationLink("Picker Examples") {
                        PickerExamplesView()
                    }

                    NavigationLink("Menu Examples") {
                        MenuExamplesView()
                    }
                }

                Section("Search") {
                    NavigationLink("Search Scopes") {
                        SearchScopesExample()
                    }

                    NavigationLink("Search Tokens") {
                        SearchTokensExample()
                    }
                }
            }
            .navigationTitle("SwiftUI Components")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
