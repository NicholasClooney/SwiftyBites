# AGENTS.md

## Scope
This repository contains Swift-related playgrounds, demos, and small example projects.

## Project Setup
Projects in this repository are typically initialized and generated with Tuist, using `tuist init` and `tuist generate`.

## Building
Use `xcodebuild` to build projects.
When invoking `xcodebuild`, prefer piping output through `xcbeautify` to reduce log volume and keep output more context- and memory-efficient.

## Commits
Use conventional commit style messages when creating commits.

## Git Workflow
Do not create branches by default.
Unless the user explicitly asks otherwise, commit and push directly to `main`.
