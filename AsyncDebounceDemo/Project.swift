import ProjectDescription

let project = Project(
    name: "AsyncDebounceDemo",
    targets: [
        .target(
            name: "AsyncDebounceDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.AsyncDebounceDemo",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "AsyncDebounceDemo/Sources",
                "AsyncDebounceDemo/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "AsyncDebounceDemoTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.AsyncDebounceDemoTests",
            infoPlist: .default,
            buildableFolders: [
                "AsyncDebounceDemo/Tests"
            ],
            dependencies: [.target(name: "AsyncDebounceDemo")]
        ),
    ]
)
