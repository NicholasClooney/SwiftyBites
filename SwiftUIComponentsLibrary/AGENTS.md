# Repository Guidelines

## Project Structure & Module Organization

This project is a Tuist-generated iOS SwiftUI demo app for reusable SwiftUI component examples.

Source code lives in `SwiftUIComponentsLibrary/Sources`:

- `App/` contains the app entry point and root navigation view.
- `Components/Pickers/` contains picker-related demos.
- `Components/Menus/` contains menu and filter pill demos.
- `Components/Search/` contains searchable list demos.
- `Shared/` contains reusable view helpers such as `ExampleSection`.

Assets live in `SwiftUIComponentsLibrary/Resources`.

## Build and Development Commands

Generate the Xcode workspace before building:

```sh
tuist generate
```

Build locally with signing disabled when no development team is configured:

```sh
xcodebuild -workspace SwiftUIComponentsLibrary.xcworkspace -scheme SwiftUIComponentsLibrary -destination 'generic/platform=iOS' CODE_SIGNING_ALLOWED=NO build | xcbeautify
```

## Coding Style & Naming Conventions

Use SwiftUI-first, small composable views. Keep each demo component in its relevant feature folder. Name example views with an `Example` suffix, such as `SearchTokensExample` or `CharacterMenuPickerExample`.

Use 4-space indentation, clear Swift type names, and concise computed properties for display labels. Prefer project-local shared views over duplicating layout wrappers.

## Commit & Git Guidelines

Use conventional commit messages, for example `feat: add menu examples` or `docs: update project guide`.

Do not create branches by default. Unless explicitly requested, commit and push directly to `main`.
