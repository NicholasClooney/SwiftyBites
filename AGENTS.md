# AGENTS.md

## Scope
This repository contains Swift-related playgrounds, demos, and small example projects.

## Project Setup
Projects in this repository are typically initialized and generated with Tuist, using `tuist init` and `tuist generate`.

## Building
Generate the Tuist workspace before building:

```sh
tuist generate
```

Build generated projects with `xcodebuild`, piping output through `xcbeautify` to reduce log volume and keep output more context- and memory-efficient.
For local generic iOS verification where signing is not configured, disable signing:

```sh
xcodebuild -workspace <ProjectName>.xcworkspace -scheme <SchemeName> -destination 'generic/platform=iOS' CODE_SIGNING_ALLOWED=NO build | xcbeautify
```

## Commits
Use conventional commit style messages when creating commits.

## Git Workflow
Do not create branches by default.
Unless the user explicitly asks otherwise, commit and push directly to `main`.
