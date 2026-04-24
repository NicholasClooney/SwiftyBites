import SwiftUI

@Observable
final class ViewModel {

    enum State {
        case idle
        case waiting
        case cancelled // before running
        case running
        case aborted // during running
    }

    var running = false
    var runCounter = 0

    private let debounceDelay: Duration = .seconds(3)
    private let testRuntime: Duration = .seconds(3)

    func runTest() async throws {
        print("Async: Waiting for delay to pass")
        try await Task.sleep(for: debounceDelay)

        print("Async: Running tests")
        try await executeLongRunningTest()
    }

    func executeLongRunningTest() async throws {
        print("Test: taking time to run")

        running = true
        defer {
            running = false
        }

        try await Task.sleep(for: testRuntime)

        runCounter += 1
        print("Test: finished running")
    }

    @ObservationIgnored
    private var runningTask: Task<Void, Never>? = nil

    func runTestSync() {
        runningTask?.cancel()

        runningTask = Task {
            print("Sync: Starting running task")
            do {
                print("Sync: Waiting for delay to pass")
                try await Task.sleep(for: debounceDelay)

                print("Sync: Running tests!")
                try await executeLongRunningTest()
            } catch is CancellationError {
                print("Sync: Cancelled")
            } catch {
                // No other errors should be raised.
                assertionFailure()
            }
        }
    }
}

public struct ContentView: View {
    public init() {}

    @State private var viewModel = ViewModel()
    @State private var syncButtonTrigger = false
    @State private var asyncButtonTrigger = false

    public var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Tests have been run \(viewModel.runCounter) times")
                }

                NavigationLink("Run Test Asynchronously", destination: TestingView())
                NavigationLink("Run Test Synchronously", destination: SyncTestingView())
            }
        }
        .environment(viewModel)
    }
}

struct SyncTestingView: View {
    @Environment(ViewModel.self) var viewModel

    var body: some View {
        VStack {
            if viewModel.running {
                Text("Running the tests synchronously!")
            } else {
                Text("Tests finished running!")
            }

            Button("Run Again & Cancel Current Run") {
                Task {
                    viewModel.runTestSync()
                }
            }
        }
        .task {
            viewModel.runTestSync()
        }
    }
}

struct TestingView: View {
    @Environment(ViewModel.self) var viewModel

    var body: some View {
        VStack {
            if viewModel.running {
                Text("Running the tests asynchronously!")
            } else {
                Text("Tests finished running!")
            }
        }
        .task {
            do {
                try await viewModel.runTest()
            } catch is CancellationError {
                print("Async: cancelled!")
            } catch {
                assertionFailure()
            }

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
