import ProjectDescription

let project = Project(
    name: "SwiftUIComponentsLibrary",
    targets: [
        .target(
            name: "SwiftUIComponentsLibrary",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.SwiftUIComponentsLibrary",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "SwiftUIComponentsLibrary/Sources",
                "SwiftUIComponentsLibrary/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "SwiftUIComponentsLibraryTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.SwiftUIComponentsLibraryTests",
            infoPlist: .default,
            buildableFolders: [
                "SwiftUIComponentsLibrary/Tests"
            ],
            dependencies: [.target(name: "SwiftUIComponentsLibrary")]
        ),
    ]
)
